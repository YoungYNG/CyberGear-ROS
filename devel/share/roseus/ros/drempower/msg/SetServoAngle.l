;; Auto-generated. Do not edit!


(when (boundp 'drempower::SetServoAngle)
  (if (not (find-package "DREMPOWER"))
    (make-package "DREMPOWER"))
  (shadow 'SetServoAngle (find-package "DREMPOWER")))
(unless (find-package "DREMPOWER::SETSERVOANGLE")
  (make-package "DREMPOWER::SETSERVOANGLE"))

(in-package "ROS")
;;//! \htmlinclude SetServoAngle.msg.html


(defclass drempower::SetServoAngle
  :super ros::object
  :slots (_id _angle _x _y _z ))

(defmethod drempower::SetServoAngle
  (:init
   (&key
    ((:id __id) 0)
    ((:angle __angle) 0.0)
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    ((:z __z) 0.0)
    )
   (send-super :init)
   (setq _id (round __id))
   (setq _angle (float __angle))
   (setq _x (float __x))
   (setq _y (float __y))
   (setq _z (float __z))
   self)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:angle
   (&optional __angle)
   (if __angle (setq _angle __angle)) _angle)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:z
   (&optional __z)
   (if __z (setq _z __z)) _z)
  (:serialization-length
   ()
   (+
    ;; uint8 _id
    1
    ;; float32 _angle
    4
    ;; float64 _x
    8
    ;; float64 _y
    8
    ;; float64 _z
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _id
       (write-byte _id s)
     ;; float32 _angle
       (sys::poke _angle (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float64 _x
       (sys::poke _x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _y
       (sys::poke _y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _z
       (sys::poke _z (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _id
     (setq _id (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float32 _angle
     (setq _angle (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float64 _x
     (setq _x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _y
     (setq _y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _z
     (setq _z (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get drempower::SetServoAngle :md5sum-) "7e2db3b2a44b9010fa914bf2531544ee")
(setf (get drempower::SetServoAngle :datatype-) "drempower/SetServoAngle")
(setf (get drempower::SetServoAngle :definition-)
      "uint8 id
float32 angle
float64 x
float64 y
float64 z
")



(provide :drempower/SetServoAngle "7e2db3b2a44b9010fa914bf2531544ee")


