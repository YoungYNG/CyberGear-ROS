;; Auto-generated. Do not edit!


(when (boundp 'drempower::info_msg)
  (if (not (find-package "DREMPOWER"))
    (make-package "DREMPOWER"))
  (shadow 'info_msg (find-package "DREMPOWER")))
(unless (find-package "DREMPOWER::INFO_MSG")
  (make-package "DREMPOWER::INFO_MSG"))

(in-package "ROS")
;;//! \htmlinclude info_msg.msg.html


(defclass drempower::info_msg
  :super ros::object
  :slots (_id _cmd_mode _Vel _limit_cur _Pos _mode ))

(defmethod drempower::info_msg
  (:init
   (&key
    ((:id __id) 0)
    ((:cmd_mode __cmd_mode) 0)
    ((:Vel __Vel) 0.0)
    ((:limit_cur __limit_cur) 0.0)
    ((:Pos __Pos) 0.0)
    ((:mode __mode) "")
    )
   (send-super :init)
   (setq _id (round __id))
   (setq _cmd_mode (round __cmd_mode))
   (setq _Vel (float __Vel))
   (setq _limit_cur (float __limit_cur))
   (setq _Pos (float __Pos))
   (setq _mode (string __mode))
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
  (:Pos
   (&optional __Pos)
   (if __Pos (setq _Pos __Pos)) _Pos)
  (:mode
   (&optional __mode)
   (if __mode (setq _mode __mode)) _mode)
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
    ;; float32 _Pos
    4
    ;; string _mode
    4 (length _mode)
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
     ;; float32 _Pos
       (sys::poke _Pos (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; string _mode
       (write-long (length _mode) s) (princ _mode s)
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
   ;; float32 _Pos
     (setq _Pos (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; string _mode
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _mode (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get drempower::info_msg :md5sum-) "d5122b929f7731dc84b5ea1e44fe06ee")
(setf (get drempower::info_msg :datatype-) "drempower/info_msg")
(setf (get drempower::info_msg :definition-)
      "uint8 id
uint8 cmd_mode
float32 Vel
float32 limit_cur
float32 Pos 
string mode
")



(provide :drempower/info_msg "d5122b929f7731dc84b5ea1e44fe06ee")


