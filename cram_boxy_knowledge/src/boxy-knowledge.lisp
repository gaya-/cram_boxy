;;;
;;; Copyright (c) 2015, Gayane Kazhoyan <kazhoyan@cs.uni-bremen.de>
;;; All rights reserved.
;;;
;;; Redistribution and use in source and binary forms, with or without
;;; modification, are permitted provided that the following conditions are met:
;;;
;;;     * Redistributions of source code must retain the above copyright
;;;       notice, this list of conditions and the following disclaimer.
;;;     * Redistributions in binary form must reproduce the above copyright
;;;       notice, this list of conditions and the following disclaimer in the
;;;       documentation and/or other materials provided with the distribution.
;;;     * Neither the name of the Institute for Artificial Intelligence/
;;;       Universitaet Bremen nor the names of its contributors may be used to
;;;       endorse or promote products derived from this software without
;;;       specific prior written permission.
;;;
;;; THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
;;; AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
;;; IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
;;; ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
;;; LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
;;; CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
;;; SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
;;; INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
;;; CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
;;; ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
;;; POSSIBILITY OF SUCH DAMAGE.

(in-package :cram-boxy-knowledge)


;; (defparameter *right-parking-end-effector-pose*
;;   (cl-transforms-stamped:make-pose-stamped
;;    "torso_base_link" 0.0
;;    (cl-transforms:make-3d-vector 0.3 -0.3 -0.23)
;;    (cl-transforms:euler->quaternion :ay (/ pi 2))))

;; (defparameter *right-parking-joint-states*
;;   '(("right_arm_0_joint" 0.0d0)
;;     ("right_arm_1_joint" 0.0d0)
;;     ("right_arm_2_joint" 0.0d0)
;;     ("right_arm_3_joint" 0.0d0)
;;     ("right_arm_4_joint" 0.0d0)
;;     ("right_arm_5_joint" 0.0d0)
;;     ("right_arm_6_joint" 0.0d0)))

;; (defparameter *left-parking-end-effector-pose*
;;   (cl-transforms-stamped:make-pose-stamped
;;    "torso_base_link" 0.0
;;    (cl-transforms:make-3d-vector 0.3 0.3 -0.23)
;;    (cl-transforms:euler->quaternion :ay (/ pi 2))))

;; (defparameter *left-parking-joint-states*
;;   '(("left_arm_0_joint" 0.0d0)
;;     ("left_arm_1_joint" 0.0d0)
;;     ("left_arm_2_joint" 0.0d0)
;;     ("left_arm_3_joint" 0.0d0)
;;     ("left_arm_4_joint" 0.0d0)
;;     ("left_arm_5_joint" 0.0d0)
;;     ("left_arm_6_joint" 0.0d0)))

;; (def-grasp :top (cl-transforms:euler->quaternion :ay (/ pi -2)))
;; (def-grasp :left (cl-transforms:euler->quaternion :az (/ pi 2)) :side)
;; (def-grasp :right (cl-transforms:euler->quaternion :az (/ pi -2)) :side)
;; (def-grasp :front (cl-transforms:make-identity-rotation))

;; (def-tool (cl-transforms:make-3d-vector 1 0 0) 0.20)


(def-fact-group boxy-metadata (robot
                               camera-frame
                               camera-minimal-height camera-maximal-height
                               robot-pan-tilt-links robot-pan-tilt-joints
                               end-effector-link gripper-link
                               planning-group
                               robot-arms-parking-joint-states
                               end-effector-parking-pose
                               robot-pre-grasp-joint-states)
  (<- (robot boxy))
  (<- (camera-frame boxy "head_mount_kinect2_rgb_optical_frame"))
  (<- (camera-minimal-height boxy 1.60))
  (<- (camera-maximal-height boxy 2.10))
  (<- (robot-pan-tilt-links boxy "pw070_box" "pw070_plate"))
  (<- (robot-pan-tilt-joints boxy "head_pan_joint" "head_tilt_joint"))
  ;; (<- (end-effector-link boxy :left "left_gripper_base_link"))
  ;; (<- (end-effector-link boxy :right "right_gripper_base_link"))
  ;; (<- (gripper-link boxy :left ?link)
  ;;   (lisp-fun search "left_gripper" ?link ?pos)
  ;;   (lisp-pred identity ?pos))
  ;; (<- (gripper-link boxy :right ?link)
  ;;   (lisp-fun search "right_gripper" ?link ?pos)
  ;;   (lisp-pred identity ?pos))
  ;; (<- (planning-group boxy :left "left_arm"))
  ;; (<- (planning-group boxy :right "right_arm"))
  ;; (<- (planning-group boxy (:left :right) "both_arms"))
  ;; (<- (planning-group boxy (:right :left) "both_arms"))

  ;; (<- (robot-arms-parking-joint-states boxy ?joint-states)
  ;;   (symbol-value *right-parking-joint-states* ?right-joint-states)
  ;;   (symbol-value *left-parking-joint-states* ?left-joint-states)
  ;;   (append ?right-joint-states ?left-joint-states ?joint-states))

  ;; (<- (robot-arms-parking-joint-states pr2 ?joint-states :left)
  ;;   (symbol-value *left-parking-joint-states* ?joint-states))

  ;; (<- (robot-arms-parking-joint-states boxy ?joint-states :right)
  ;;   (symbol-value *right-parking-joint-states* ?joint-states))

  ;; (<- (end-effector-parking-pose boxy ?pose :left)
  ;;   (symbol-value *left-parking-end-effector-pose* ?pose))

  ;; (<- (end-effector-parking-pose boxy ?pose :right)
  ;;   (symbol-value *right-parking-end-effector-pose* ?pose))

  ;; (<- (robot-pre-grasp-joint-states boxy
  ;;      (("torso_joint" 0.33) . ?parking-joint-states))
  ;;   (robot-arms-parking-joint-states boxy ?parking-joint-states))

  ;; (<- (robot-pre-grasp-joint-states boxy
  ;;      (("torso_joint" 0.165) . ?parking-joint-states))
  ;;   (robot-arms-parking-joint-states boxy ?parking-joint-states))

  ;; (<- (robot-pre-grasp-joint-states boxy
  ;;      (("torso_joint" 0.00) . ?parking-joint-states))
  ;;   (robot-arms-parking-joint-states boxy ?parking-joint-states))
  )

;; (defun object-type->tool-length (object-type)
;;   (let ((bounding-box (btr:household-object-dimensions object-type)))
;;     (cram-robot-interfaces:calculate-bounding-box-tool-length
;;      bounding-box)))

;; (def-fact-group boxy-manipulation-knowledge (grasp
;;                                              side
;;                                              arm
;;                                              object-type-grasp
;;                                              object-designator-grasp
;;                                              object-type-tool-length
;;                                              object-designator-tool-length
;;                                              orientation-matters
;;                                              required-arms
;;                                              available-arms)
;;   (<- (grasp boxy :top))
;;   (<- (grasp boxy :side))
;;   (<- (grasp boxy :front))

;;   (<- (side boxy :right))
;;   (<- (side boxy :left))

;;   (<- (arm boxy ?arm)
;;     (side boxy ?arm))

;;   (<- (object-type-grasp :mug ?grasp (?side))
;;     (grasp boxy ?grasp)
;;     (side boxy ?side))

;;   (<- (object-type-grasp :mondamin :side (:right)))

;;   (<- (object-type-grasp :plate :side (:left :right)))

;;   (<- (object-type-grasp :pot :side (:left :right)))

;;   (<- (object-type-grasp :handle :front (?side))
;;     (side boxy ?side))

;;   (<- (object-type-grasp ?type :top (?side))
;;     (member ?type (:cutlery :knife :fork :spatula))
;;     (side boxy ?side))

;;   (<- (object-designator-grasp ?object-designator ?grasp ?sides)
;;     (lisp-fun desig:current-desig ?object-designator ?current-object-designator)
;;     (desig:desig-prop ?current-object-designator (:type ?object-type))
;;     (object-type-grasp ?object-type ?grasp ?sides))

;;   (<- (%object-type-tool-length ?object-type ?grasp ?tool-length)
;;     (object-type-grasp ?object-type ?grasp ?_)
;;     (lisp-fun object-type->tool-length ?object-type ?tool-length))

;;   (<- (object-type-tool-length ?object-type ?grasp ?tool-length)
;;     (once
;;      (or
;;       (%object-type-tool-length ?object-type ?grasp ?tool-length)
;;       (== ?tool-length 0.0)))
;;     (robot ?robot)
;;     (grasp ?robot ?grasp))

;;   (<- (object-designator-tool-length
;;        ?object-designator ?grasp ?tool-length)
;;     (lisp-fun desig:current-desig ?object-designator ?current-object-designator)
;;     (desig:desig-prop ?current-object-designator (:type ?object-type))
;;     (object-type-tool-length ?object-type ?grasp ?tool-length))

;;   (<- (orientation-matters ?object-designator)
;;     (lisp-fun desig:current-desig ?object-designator ?current-object-designator)
;;     (or (desig:desig-prop ?current-object-designator (:type :knife))
;;         (desig:desig-prop ?current-object-designator (:type :fork))
;;         (desig:desig-prop ?current-object-designator (:type :spatula))))

;;   (<- (required-arms ?object-designator ?arms)
;;     (desig:desig-prop ?object-designator (:type ?object-type))
;;     ;; object-type-grasp will give the cross-product of all available
;;     ;; arms and grasps. That's why we first calculate the set of all
;;     ;; solutions of arms (i.e. duplicate arms removed).
;;     (once
;;      (or
;;       (setof ?arms (object-type-grasp ?object-type ?_ ?arms) ?all-arms-solutions)
;;       (setof (?arm) (and (robot ?robot) (arm ?robot ?arm)) ?all-arms-solutions)))
;;     (member ?arms ?all-arms-solutions))

;;   (<- (available-arms ?object-designator ?arms)
;;     (robot ?robot)
;;     (required-arms ?object-designator ?arms)
;;     (forall (member ?arm ?arms)
;;             (and
;;              (end-effector-link ?robot ?arm ?link)
;;              (not (btr:attached ?_ ?robot ?link ?_))))))
