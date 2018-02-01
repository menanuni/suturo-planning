;; Regression test INVERSE-MATRIX-PRODUCT for GSLL, automatically generated
;;
;; Copyright 2009, 2010, 2011, 2014 Liam M. Healy
;; Distributed under the terms of the GNU General Public License
;;
;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

(in-package :gsl)

(LISP-UNIT:DEFINE-TEST INVERSE-MATRIX-PRODUCT
  (LISP-UNIT::ASSERT-NUMERICAL-EQUAL
   (LIST
    #2A((-30.708971f0 5.3737082f0 -25.897392f0)
	(-14.654706f0 -9.08723f0 6.96797f0)
	(-29.71983f0 -24.015656f0 -29.949932f0)))
   (MULTIPLE-VALUE-LIST
    (LET ((M1
	   (GRID:MAKE-FOREIGN-ARRAY
	    'SINGLE-FLOAT :INITIAL-CONTENTS
	    '((-34.5f0 8.24f0 3.29f0)
	      (-8.93f0 34.12f0 -6.15f0)
	      (49.27f0 -13.49f0 32.5f0))))
	  (M2
	   (GRID:MAKE-FOREIGN-ARRAY
	    'SINGLE-FLOAT :INITIAL-CONTENTS
	    '((42.73f0 -17.24f0 43.31f0)
	      (-16.12f0 -8.25f0 21.44f0)
	      (-49.08f0 -39.66f0 -49.46f0))))
	  (S1 19.68f0))
      (GRID:COPY-TO (INVERSE-MATRIX-PRODUCT M1 M2 S1) 'array 'single-float))))
  (LISP-UNIT::ASSERT-NUMERICAL-EQUAL
   (LIST
    #2A((-30.708968222785604d0 5.373707833953741d0
			       -25.89739157520614d0)
	(-14.654705167282895d0 -9.087229795292632d0
			       6.967969411128146d0)
	(-29.71982769230769d0 -24.015655384615382d0
                              -29.949932307692308d0)))
   (MULTIPLE-VALUE-LIST
    (LET ((M1
	   (GRID:MAKE-FOREIGN-ARRAY
	    'DOUBLE-FLOAT :INITIAL-CONTENTS
	    '((-34.5d0 8.24d0 3.29d0)
	      (-8.93d0 34.12d0 -6.15d0)
	      (49.27d0 -13.49d0 32.5d0))))
	  (M2
	   (GRID:MAKE-FOREIGN-ARRAY
	    'DOUBLE-FLOAT :INITIAL-CONTENTS
	    '((42.73d0 -17.24d0 43.31d0)
	      (-16.12d0 -8.25d0 21.44d0)
	      (-49.08d0 -39.66d0 -49.46d0))))
	  (S1 19.68d0))
      (GRID:COPY-TO (INVERSE-MATRIX-PRODUCT M1 M2 S1) 'array 'double-float))))
  #+fsbv
  (LISP-UNIT::ASSERT-NUMERICAL-EQUAL
   (LIST
    #2A((#C(-28.191956f0 35.052914f0) #C(-13.378113f0 28.736774f0)
	   #C(5.4411864f0 -3.0717967f0))
	(#C(5.1555862f0 -11.330741f0) #C(-33.49236f0 -12.241006f0)
	   #C(-10.527424f0 20.3357f0))
	(#C(-0.71776515f0 27.669863f0) #C(20.046593f0 11.972884f0)
	   #C(-1.5907472f0 4.2853727f0))))
   (MULTIPLE-VALUE-LIST
    (LET ((M1
	   (GRID:MAKE-FOREIGN-ARRAY
	    '(COMPLEX SINGLE-FLOAT)
	    :INITIAL-CONTENTS
	    '((#C(-34.5f0 8.24f0) #C(3.29f0 -8.93f0) #C(34.12f0 -6.15f0))
	      (#C(-8.93f0 34.12f0) #C(-6.15f0 49.27f0) #C(-13.49f0 32.5f0))
	      (#C(49.27f0 -13.49f0) #C(32.5f0 42.73f0) #C(-17.24f0 43.31f0)))))
	  (M2
	   (GRID:MAKE-FOREIGN-ARRAY
	    '(COMPLEX SINGLE-FLOAT)
	    :INITIAL-CONTENTS
	    '((#C(42.73f0 -17.24f0) #C(43.31f0 -16.12f0) #C(-8.25f0 21.44f0))
	      (#C(-16.12f0 -8.25f0) #C(21.44f0 -49.08f0) #C(-39.66f0 -49.46f0))
	      (#C(-49.08f0 -39.66f0) #C(-49.46f0 19.68f0) #C(-5.55f0 -8.82f0)))))
	  (S1 #C(19.68f0 -5.55f0)))
      (GRID:COPY-TO (INVERSE-MATRIX-PRODUCT M1 M2 S1) 'array '(complex single-float)))))
  #+fsbv
  (LISP-UNIT::ASSERT-NUMERICAL-EQUAL
   (LIST
    #2A((#C(-28.191956546692666d0 35.052909000810466d0)
	   #C(-13.378112744466048d0 28.736769449657892d0)
	   #C(5.441186078394205d0 -3.071795512940909d0))
	(#C(5.155586147762611d0 -11.330740389402608d0)
	   #C(-33.49236130612107d0 -12.241006594989193d0)
	   #C(-10.527425621635187d0 20.33570209413866d0))
	(#C(-0.7177649743298794d0 27.669860728641122d0)
	   #C(20.046591997869093d0 11.972882797431007d0)
	   #C(-1.590747546093172d0 4.285372608973592d0))))
   (MULTIPLE-VALUE-LIST
    (LET ((M1
	   (GRID:MAKE-FOREIGN-ARRAY
	    '(COMPLEX DOUBLE-FLOAT)
	    :INITIAL-CONTENTS
	    '((#C(-34.5d0 8.24d0) #C(3.29d0 -8.93d0) #C(34.12d0 -6.15d0))
	      (#C(-8.93d0 34.12d0) #C(-6.15d0 49.27d0) #C(-13.49d0 32.5d0))
	      (#C(49.27d0 -13.49d0) #C(32.5d0 42.73d0) #C(-17.24d0 43.31d0)))))
	  (M2
	   (GRID:MAKE-FOREIGN-ARRAY
	    '(COMPLEX DOUBLE-FLOAT)
	    :INITIAL-CONTENTS
	    '((#C(42.73d0 -17.24d0) #C(43.31d0 -16.12d0) #C(-8.25d0 21.44d0))
	      (#C(-16.12d0 -8.25d0) #C(21.44d0 -49.08d0) #C(-39.66d0 -49.46d0))
	      (#C(-49.08d0 -39.66d0) #C(-49.46d0 19.68d0) #C(-5.55d0 -8.82d0)))))
	  (S1 #C(19.68d0 -5.55d0)))
      (GRID:COPY-TO (INVERSE-MATRIX-PRODUCT M1 M2 S1) 'array '(complex double-float)))))
  (LISP-UNIT::ASSERT-NUMERICAL-EQUAL
   (LIST #(-1.1747805f0 -0.26507667f0 1.3326154f0))
   (MULTIPLE-VALUE-LIST
    (LET ((M1
	   (GRID:MAKE-FOREIGN-ARRAY
	    'SINGLE-FLOAT :INITIAL-CONTENTS
	    '((-34.5f0 8.24f0 3.29f0)
	      (-8.93f0 34.12f0 -6.15f0)
	      (49.27f0 -13.49f0 32.5f0))))
	  (V1
	   (GRID:MAKE-FOREIGN-ARRAY
	    'SINGLE-FLOAT :INITIAL-CONTENTS
	    '(42.73f0 -17.24f0 43.31f0)))
	  (S1 -16.12f0))
      (GRID:COPY-TO (INVERSE-MATRIX-PRODUCT M1 V1 S1) 'array 'single-float))))
  (LISP-UNIT::ASSERT-NUMERICAL-EQUAL
   (LIST
    #(-1.1747804927980594d0 -0.26507665253855167d0
      1.3326153846153848d0))
   (MULTIPLE-VALUE-LIST
    (LET ((M1
	   (GRID:MAKE-FOREIGN-ARRAY
	    'DOUBLE-FLOAT :INITIAL-CONTENTS
	    '((-34.5d0 8.24d0 3.29d0)
	      (-8.93d0 34.12d0 -6.15d0)
	      (49.27d0 -13.49d0 32.5d0))))
	  (V1
	   (GRID:MAKE-FOREIGN-ARRAY 'DOUBLE-FLOAT :INITIAL-CONTENTS
				    '(42.73d0 -17.24d0 43.31d0)))
	  (S1 -16.12d0))
      (GRID:COPY-TO (INVERSE-MATRIX-PRODUCT M1 V1 S1) 'array 'double-float))))
  (LISP-UNIT::ASSERT-NUMERICAL-EQUAL
   (LIST
    #(#C(-1.1218005f0 0.24990065f0) #C(-0.7679142f0 -0.9143634f0)
      #C(0.4927793f0 -0.0056687724f0)))
   (MULTIPLE-VALUE-LIST
    (LET ((M1
	   (GRID:MAKE-FOREIGN-ARRAY
	    '(COMPLEX SINGLE-FLOAT)
	    :INITIAL-CONTENTS
	    '((#C(-34.5f0 8.24f0) #C(3.29f0 -8.93f0) #C(34.12f0 -6.15f0))
	      (#C(-8.93f0 34.12f0) #C(-6.15f0 49.27f0) #C(-13.49f0 32.5f0))
	      (#C(49.27f0 -13.49f0) #C(32.5f0 42.73f0) #C(-17.24f0 43.31f0)))))
	  (V1
	   (GRID:MAKE-FOREIGN-ARRAY
	    '(COMPLEX SINGLE-FLOAT)
	    :INITIAL-CONTENTS
	    '(#C(42.73f0 -17.24f0) #C(43.31f0 -16.12f0) #C(-8.25f0 21.44f0))))
	  (S1 #C(-16.12f0 -8.25f0)))
      (GRID:COPY-TO (INVERSE-MATRIX-PRODUCT M1 V1 S1) 'array '(complex single-float)))))
  (LISP-UNIT::ASSERT-NUMERICAL-EQUAL
   (LIST
    #(#C(-1.1218005239477833d0 0.2499006037347623d0)
      #C(-0.7679142088967384d0 -0.9143634017568469d0)
      #C(0.49277927293827817d0 -0.005668775466541512d0)))
   (MULTIPLE-VALUE-LIST
    (LET ((M1
	   (GRID:MAKE-FOREIGN-ARRAY
	    '(COMPLEX DOUBLE-FLOAT)
	    :INITIAL-CONTENTS
	    '((#C(-34.5d0 8.24d0) #C(3.29d0 -8.93d0) #C(34.12d0 -6.15d0))
	      (#C(-8.93d0 34.12d0) #C(-6.15d0 49.27d0) #C(-13.49d0 32.5d0))
	      (#C(49.27d0 -13.49d0) #C(32.5d0 42.73d0) #C(-17.24d0 43.31d0)))))
	  (V1
	   (GRID:MAKE-FOREIGN-ARRAY
	    '(COMPLEX DOUBLE-FLOAT)
	    :INITIAL-CONTENTS
	    '(#C(42.73d0 -17.24d0) #C(43.31d0 -16.12d0) #C(-8.25d0 21.44d0))))
	  (S1 #C(-16.12d0 -8.25d0)))
      (GRID:COPY-TO (INVERSE-MATRIX-PRODUCT M1 V1 S1) 'array '(complex double-float))))))
