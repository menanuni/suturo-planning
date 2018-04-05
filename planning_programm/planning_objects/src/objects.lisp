(in-package :planning-objects)

(defvar *marker-publisher* nil)
(defvar *marker-id* 10)

(defvar *last-y-border-y-1* 9.0)
(defvar *last-y-border-y-2* 9.0)
(defvar *last-y-border-y-3* 9.0)
(defvar *last-y-border-y-4* 9.0)

(defun calculate-landing-zone (object gripper)
  (let ((landing-zone-message
          (planning-knowledge::ask-knowledge-where-belongs object)))
    (roslisp:with-fields ((width (storage_place_width))
                          (height (storage_place_height))
                          (position (storage_place_position)))
        landing-zone-message
      (setf width (- width 0.19))
      (setf height (- height 0.2))
      (let ((middle-point-landing-zone-pose
              (cl-tf:to-msg (fill-landing-zone-horizontally position width height)))
            (gripper-msg (roslisp:make-message "knowledge_msgs/gripper" :gripper gripper)))
        (roslisp:with-fields ((exact-landing-x
                               (geometry_msgs-msg:x geometry_msgs-msg:position geometry_msgs-msg:pose))
                              (exact-landing-y
                               (geometry_msgs-msg:y geometry_msgs-msg:position geometry_msgs-msg:pose))) middle-point-landing-zone-pose
          (let ((landing-pose-message
                  (planning-knowledge::place-object gripper-msg "/map" exact-landing-x exact-landing-y)))         
            (return-from calculate-landing-zone landing-pose-message)))))))

(defun fill-landing-zone-horizontally (position width height)
  (cpl:with-failure-handling
        ((cpl:simple-plan-failure (error-object)
           (format t "An error happened: ~a~%" error-object)
           (roslisp:ros-error "Objects" "Out of storage space!")))
  (roslisp:with-fields ((x (geometry_msgs-msg:x geometry_msgs-msg:point))
                        (y (geometry_msgs-msg:y geometry_msgs-msg:point))
                        (z (geometry_msgs-msg:z geometry_msgs-msg:point)))
      position
    (let ((last-y-border)
          (current-y-border)
          (width-split (/ width 2.0))
          (height-split (/ height 2.0)))

      (cond ((>= y (- 1.13063 width-split))
             (setf last-y-border *last-y-border-y-1*))
            ((>= y (- 0.75563 width-split))
             (setf last-y-border *last-y-border-y-2*))
            ((>= y (- 0.38063 width-split))
             (setf last-y-border *last-y-border-y-3*))
            ((>= y (- 0.00563 width-split))
            (setf last-y-border *last-y-border-y-4*)))
      
      
      (if (<= last-y-border (- y width-split))
          (cpl:fail 'planning-error::objects-error :message "Out of storage space!"))
      (if (= last-y-border 9.0)
          (setf last-y-border (+ y width-split)))
      (let* ((random-height (random height-split))
             (landing-zone-width (/ width 2.0))
             (current-middle-point-x (- x random-height))
             (current-middle-point-y (- last-y-border (/ landing-zone-width 2.0)))
             (landing-zone-pose (cl-tf:make-pose-stamped
                                              "/map"
                                              0.0
                                              (cl-transforms:make-3d-vector current-middle-point-x current-middle-point-y z)
                                              (cl-transforms:make-quaternion 0 0 0 1))))
        (print last-y-border)
        (print y)
        (print width-split)
        
        (setf current-y-border (- last-y-border landing-zone-width))
        
        (cond ((>= y (- 1.13063 width-split))
               (setf *last-y-border-y-1* current-y-border))
              ((>= y (- 0.75563 width-split))
               (setf *last-y-border-y-2* current-y-border))
              ((>= y (- 0.38063 width-split))
               (setf *last-y-border-y-3* current-y-border))
              ((>= y (- 0.00563 width-split))
               (setf *last-y-border-y-4* current-y-border)))
        (return-from fill-landing-zone-horizontally landing-zone-pose))))))

(defun clear-all-landing-zones ()
  (setf *last-y-border-y-1* 9.0)
  (setf *last-y-border-y-2* 9.0)
  (setf *last-y-border-y-3* 9.0)
  (setf *last-y-border-y-4* 9.0))

(defun calculate-landing-zone-visualized (object gripper)
  (let ((landing-zone-pose (calculate-landing-zone object gripper)))
    (visualize-landing-zone landing-zone-pose)
    (incf *marker-id*)
    (return-from calculate-landing-zone-visualized landing-zone-pose)))
  
           
;;(defun check-which-storage-place (y))
;könnte etwas Redundanz vermindern

;;(defun clear-all-markers ())
;nützlich

(defun visualize-landing-zone (landing-zone-pose)
  (vis-init)
  (publish-pose landing-zone-pose *marker-id* 0.1 0.09166666616996129))

(defun vis-init ()
  (setf *marker-publisher*
        (roslisp:advertise "~location_marker" "visualization_msgs/Marker")))

(defun publish-pose (pose id height width)
  ;(roslisp:with-fields ((place-pose (knowledge_msgs-srv:place_pose))) pose
  ;(setf pose (cl-tf:from-msg place-pose)))
  (let ((point (cl-transforms:origin pose))
        (rot (cl-transforms:orientation pose))
        (current-index 0)
        (red (random 1.0))
        (green (random 1.0))
        (blue (random 1.0)))
    (when *marker-publisher*
      (roslisp:publish *marker-publisher*
                       (roslisp:make-message "visualization_msgs/Marker"
                                             (std_msgs-msg:stamp header) 
                                             (roslisp:ros-time)
                                             (std_msgs-msg:frame_id header)
                                             (typecase pose
                                               (cl-tf:pose-stamped (cl-tf:frame-id pose))
                                               (t "map"))
                                             ns "goal_locations"
                                             id (or id (incf current-index))
                                             type (roslisp:symbol-code
                                                   'visualization_msgs-msg:<marker> :cube)
                                             action (roslisp:symbol-code
                                                     'visualization_msgs-msg:<marker> :add)
                                             (x position pose) (cl-transforms:x point)
                                             (y position pose) (cl-transforms:y point)
                                             (z position pose) (cl-transforms:z point)
                                             (x orientation pose) (cl-transforms:x rot)
                                             (y orientation pose) (cl-transforms:y rot)
                                             (z orientation pose) (cl-transforms:z rot)
                                             (w orientation pose) (cl-transforms:w rot)
                                             (x scale) height
                                             (y scale) width
                                             (z scale) 0.1
                                             (r color) red
                                             (g color) green
                                             (b color) blue
                                             (a color) 1.0)))))
      

