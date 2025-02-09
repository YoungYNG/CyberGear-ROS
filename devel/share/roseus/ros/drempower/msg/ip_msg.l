;; Auto-generated. Do not edit!


(when (boundp 'drempower::ip_msg)
  (if (not (find-package "DREMPOWER"))
    (make-package "DREMPOWER"))
  (shadow 'ip_msg (find-package "DREMPOWER")))
(unless (find-package "DREMPOWER::IP_MSG")
  (make-package "DREMPOWER::IP_MSG"))

(in-package "ROS")
;;//! \htmlinclude ip_msg.msg.html


(defclass drempower::ip_msg
  :super ros::object
  :slots (_id _cmd_mode _torque _Pos _speed _kp _kd ))

(defmethod drempower::ip_msg
  (:init
   (&key
    ((:id __id) 0)
    ((:cmd_mode __cmd_mode) 0)
    ((:torque __torque) 0.0)
    ((:Pos __Pos) 0.0)
    ((:speed __speed) 0.0)
    ((:kp __kp) 0.0)
    ((:kd __kd) 0.0)
    )
   (send-super :init)
   (setq _id (round __id))
   (setq _cmd_mode (round __cmd_mode))
   (setq _torque (float __torque))
   (setq _Pos (float __Pos))
   (setq _speed (float __speed))
   (setq _kp (float __kp))
   (setq _kd (float __kd))
   self)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:cmd_mode
   (&optional __cmd_mode)
   (if __cmd_mode (setq _cmd_mode __cmd_mode)) _cmd_mode)
  (:torque
   (&optional __torque)
   (if __torque (setq _torque __torque)) _torque)
  (:Pos
   (&optional __Pos)
   (if __Pos (setq _Pos __Pos)) _Pos)
  (:speed
   (&optional __speed)
   (if __speed (setq _speed __speed)) _speed)
  (:kp
   (&optional __kp)
   (if __kp (setq _kp __kp)) _kp)
  (:kd
   (&optional __kd)
   (if __kd (setq _kd __kd)) _kd)
  (:serialization-length
   ()
   (+
    ;; uint8 _id
    1
    ;; uint8 _cmd_mode
    1
    ;; float32 _torque
    4
    ;; float32 _Pos
    4
    ;; float32 _speed
    4
    ;; float32 _kp
    4
    ;; float32 _kd
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _id
       (write-byte _id s)
     ;; uint8 _cmd_mode
       (write-byte _cmd_mode s)
     ;; float32 _torque
       (sys::poke _torque (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _Pos
       (sys::poke _Pos (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _speed
       (sys::poke _speed (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _kp
       (sys::poke _kp (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _kd
       (sys::poke _kd (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _id
     (setq _id (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _cmd_mode
     (setq _cmd_mode (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float32 _torque
     (setq _torque (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _Pos
     (setq _Pos (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _speed
     (setq _speed (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _kp
     (setq _kp (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _kd
     (setq _kd (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get drempower::ip_msg :md5sum-) "8d3fd0cf5bc3255fd077802cc1d02666")
(setf (get drempower::ip_msg :datatype-) "drempower/ip_msg")
(setf (get drempower::ip_msg :definition-)
      "uint8 id
uint8 cmd_mode
float32 torque 
float32 Pos 
float32 speed 
float32 kp 
float32 kd 

")



(provide :drempower/ip_msg "8d3fd0cf5bc3255fd077802cc1d02666")


