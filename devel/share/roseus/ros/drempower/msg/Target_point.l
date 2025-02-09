;; Auto-generated. Do not edit!


(when (boundp 'drempower::Target_point)
  (if (not (find-package "DREMPOWER"))
    (make-package "DREMPOWER"))
  (shadow 'Target_point (find-package "DREMPOWER")))
(unless (find-package "DREMPOWER::TARGET_POINT")
  (make-package "DREMPOWER::TARGET_POINT"))

(in-package "ROS")
;;//! \htmlinclude Target_point.msg.html


(defclass drempower::Target_point
  :super ros::object
  :slots (_x _y _motion ))

(defmethod drempower::Target_point
  (:init
   (&key
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    ((:motion __motion) nil)
    )
   (send-super :init)
   (setq _x (float __x))
   (setq _y (float __y))
   (setq _motion __motion)
   self)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:motion
   (&optional (__motion :null))
   (if (not (eq __motion :null)) (setq _motion __motion)) _motion)
  (:serialization-length
   ()
   (+
    ;; float32 _x
    4
    ;; float32 _y
    4
    ;; bool _motion
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _x
       (sys::poke _x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _y
       (sys::poke _y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; bool _motion
       (if _motion (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _x
     (setq _x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _y
     (setq _y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; bool _motion
     (setq _motion (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get drempower::Target_point :md5sum-) "943eefa7a7b753a3f2176e70f130d3b3")
(setf (get drempower::Target_point :datatype-) "drempower/Target_point")
(setf (get drempower::Target_point :definition-)
      "float32 x
float32 y
bool motion
")



(provide :drempower/Target_point "943eefa7a7b753a3f2176e70f130d3b3")


