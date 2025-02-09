;; Auto-generated. Do not edit!


(when (boundp 'drempower::ft_msg)
  (if (not (find-package "DREMPOWER"))
    (make-package "DREMPOWER"))
  (shadow 'ft_msg (find-package "DREMPOWER")))
(unless (find-package "DREMPOWER::FT_MSG")
  (make-package "DREMPOWER::FT_MSG"))

(in-package "ROS")
;;//! \htmlinclude ft_msg.msg.html


(defclass drempower::ft_msg
  :super ros::object
  :slots (_id _cmd_mode _torque ))

(defmethod drempower::ft_msg
  (:init
   (&key
    ((:id __id) 0)
    ((:cmd_mode __cmd_mode) 0)
    ((:torque __torque) 0.0)
    )
   (send-super :init)
   (setq _id (round __id))
   (setq _cmd_mode (round __cmd_mode))
   (setq _torque (float __torque))
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
  (:serialization-length
   ()
   (+
    ;; uint8 _id
    1
    ;; uint8 _cmd_mode
    1
    ;; float32 _torque
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
   ;;
   self)
  )

(setf (get drempower::ft_msg :md5sum-) "ebe2a773be5d177c183b7b4f0377a6a2")
(setf (get drempower::ft_msg :datatype-) "drempower/ft_msg")
(setf (get drempower::ft_msg :definition-)
      "uint8 id
uint8 cmd_mode
float32 torque
")



(provide :drempower/ft_msg "ebe2a773be5d177c183b7b4f0377a6a2")


