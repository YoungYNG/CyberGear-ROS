;; Auto-generated. Do not edit!


(when (boundp 'drempower::enable_msg)
  (if (not (find-package "DREMPOWER"))
    (make-package "DREMPOWER"))
  (shadow 'enable_msg (find-package "DREMPOWER")))
(unless (find-package "DREMPOWER::ENABLE_MSG")
  (make-package "DREMPOWER::ENABLE_MSG"))

(in-package "ROS")
;;//! \htmlinclude enable_msg.msg.html


(defclass drempower::enable_msg
  :super ros::object
  :slots (_id _cmd_mode ))

(defmethod drempower::enable_msg
  (:init
   (&key
    ((:id __id) 0)
    ((:cmd_mode __cmd_mode) 0)
    )
   (send-super :init)
   (setq _id (round __id))
   (setq _cmd_mode (round __cmd_mode))
   self)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:cmd_mode
   (&optional __cmd_mode)
   (if __cmd_mode (setq _cmd_mode __cmd_mode)) _cmd_mode)
  (:serialization-length
   ()
   (+
    ;; uint8 _id
    1
    ;; uint8 _cmd_mode
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _id
       (write-byte _id s)
     ;; uint8 _cmd_mode
       (write-byte _cmd_mode s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _id
     (setq _id (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _cmd_mode
     (setq _cmd_mode (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get drempower::enable_msg :md5sum-) "1052ee68e918215aa757f20d4ef4b17f")
(setf (get drempower::enable_msg :datatype-) "drempower/enable_msg")
(setf (get drempower::enable_msg :definition-)
      "uint8 id
uint8 cmd_mode



")



(provide :drempower/enable_msg "1052ee68e918215aa757f20d4ef4b17f")


