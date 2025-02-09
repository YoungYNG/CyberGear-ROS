;; Auto-generated. Do not edit!


(when (boundp 'drempower::fv_msg)
  (if (not (find-package "DREMPOWER"))
    (make-package "DREMPOWER"))
  (shadow 'fv_msg (find-package "DREMPOWER")))
(unless (find-package "DREMPOWER::FV_MSG")
  (make-package "DREMPOWER::FV_MSG"))

(in-package "ROS")
;;//! \htmlinclude fv_msg.msg.html


(defclass drempower::fv_msg
  :super ros::object
  :slots (_id _cmd_mode _Vel _limit_cur ))

(defmethod drempower::fv_msg
  (:init
   (&key
    ((:id __id) 0)
    ((:cmd_mode __cmd_mode) 0)
    ((:Vel __Vel) 0.0)
    ((:limit_cur __limit_cur) 0.0)
    )
   (send-super :init)
   (setq _id (round __id))
   (setq _cmd_mode (round __cmd_mode))
   (setq _Vel (float __Vel))
   (setq _limit_cur (float __limit_cur))
   self)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:cmd_mode
   (&optional __cmd_mode)
   (if __cmd_mode (setq _cmd_mode __cmd_mode)) _cmd_mode)
  (:Vel
   (&optional __Vel)
   (if __Vel (setq _Vel __Vel)) _Vel)
  (:limit_cur
   (&optional __limit_cur)
   (if __limit_cur (setq _limit_cur __limit_cur)) _limit_cur)
  (:serialization-length
   ()
   (+
    ;; uint8 _id
    1
    ;; uint8 _cmd_mode
    1
    ;; float32 _Vel
    4
    ;; float32 _limit_cur
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
     ;; float32 _Vel
       (sys::poke _Vel (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _limit_cur
       (sys::poke _limit_cur (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _id
     (setq _id (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _cmd_mode
     (setq _cmd_mode (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float32 _Vel
     (setq _Vel (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _limit_cur
     (setq _limit_cur (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get drempower::fv_msg :md5sum-) "ac95f8c594785dbf2c534cdd6f9f2d09")
(setf (get drempower::fv_msg :datatype-) "drempower/fv_msg")
(setf (get drempower::fv_msg :definition-)
      "uint8 id
uint8 cmd_mode
float32 Vel
float32 limit_cur


")



(provide :drempower/fv_msg "ac95f8c594785dbf2c534cdd6f9f2d09")


