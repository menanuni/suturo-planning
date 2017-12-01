(in-package :planning-motion)

(defun call-Motion-Move-Arm ()
  "Moves robot-arms into home position"
  (let ((actionclient 
    (actionlib:make-action-client "/moving" "motion_msgs/MovingCommandAction")))
    (loop until
          (actionlib:wait-for-server actionclient))
    (let ((xtrans
      (cl-tf:make-point-stamped "base_link" 0 
                                (cl-transforms:make-3d-vector 5.0 3.0 1.2))))
      (let ((actiongoal 
        (actionlib:make-action-goal actionclient point_stamped xtrans command 1)))
        (actionlib:call-goal actionclient actiongoal)))))

		


(defun call-Motion-Move-To-Point (point-center-of-object)
  "Moves right arm to poke-point"
  (let ((actionclient 
    (actionlib:make-action-client "/moving" "motion_msgs/MovingCommandAction")))
    (loop until
          (actionlib:wait-for-server actionclient))
    (let ((actiongoal
      (actionlib:make-action-goal actionclient point_stamped point-center-of-object command 3)))
      (actionlib:call-goal actionclient actiongoal))))

