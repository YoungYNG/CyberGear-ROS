;; Auto-generated. Do not edit!


(when (boundp 'drempower::state_msg)
  (if (not (find-package "DREMPOWER"))
    (make-package "DREMPOWER"))
  (shadow 'state_msg (find-package "DREMPOWER")))
(unless (find-package "DREMPOWER::STATE_MSG")
  (make-package "DREMPOWER::STATE_MSG"))

(in-package "ROS")
;;//! \htmlinclude state_msg.msg.html


(defclass drempower::state_msg
  :super ros::object
  :slots (_id _cmd_mode _cmd_data _pos_estimate _vel_estimate _torque_estimate _temp ))

(defmethod drempower::state_msg
  (:init
   (&key
    ((:id __id) 0)
    ((:cmd_mode __cmd_mode) 0)
    ((:cmd_data __cmd_data) 0)
    ((:pos_estimate __pos_estimate) 0.0)
    ((:vel_estimate __vel_estimate) 0.0)
    ((:torque_estimate __torque_estimate) 0.0)
    ((:temp __temp) 0.0)
    )
   (send-super :init)
   (setq _id (round __id))
   (setq _cmd_mode (round __cmd_mode))
   (setq _cmd_data (round __cmd_data))
   (setq _pos_estimate (float __pos_estimate))
   (setq _vel_estimate (float __vel_estimate))
   (setq _torque_estimate (float __torque_estimate))
   (setq _temp (float __temp))
   self)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:cmd_mode
   (&optional __cmd_mode)
   (if __cmd_mode (setq _cmd_mode __cmd_mode)) _cmd_mode)
  (:cmd_data
   (&optional __cmd_data)
   (if __cmd_data (setq _cmd_data __cmd_data)) _cmd_data)
  (:pos_estimate
   (&optional __pos_estimate)
   (if __pos_estimate (setq _pos_estimate __pos_estimate)) _pos_estimate)
  (:vel_estimate
   (&optional __vel_estimate)
   (if __vel_estimate (setq _vel_estimate __vel_estimate)) _vel_estimate)
  (:torque_estimate
   (&optional __torque_estimate)
   (if __torque_estimate (setq _torque_estimate __torque_estimate)) _torque_estimate)
  (:temp
   (&optional __temp)
   (if __temp (setq _temp __temp)) _temp)
  (:serialization-length
   ()
   (+
    ;; uint16 _id
    2
    ;; uint8 _cmd_mode
    1
    ;; uint16 _cmd_data
    2
    ;; float32 _pos_estimate
    4
    ;; float32 _vel_estimate
    4
    ;; float32 _torque_estimate
    4
    ;; float32 _temp
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint16 _id
       (write-word _id s)
     ;; uint8 _cmd_mode
       (write-byte _cmd_mode s)
     ;; uint16 _cmd_data
       (write-word _cmd_data s)
     ;; float32 _pos_estimate
       (sys::poke _pos_estimate (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _vel_estimate
       (sys::poke _vel_estimate (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _torque_estimate
       (sys::poke _torque_estimate (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _temp
       (sys::poke _temp (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint16 _id
     (setq _id (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint8 _cmd_mode
     (setq _cmd_mode (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint16 _cmd_data
     (setq _cmd_data (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; float32 _pos_estimate
     (setq _pos_estimate (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _vel_estimate
     (setq _vel_estimate (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _torque_estimate
     (setq _torque_estimate (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _temp
     (setq _temp (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get drempower::state_msg :md5sum-) "7e078fbada3d91b85209b327d5ded4f9")
(setf (get drempower::state_msg :datatype-) "drempower/state_msg")
(setf (get drempower::state_msg :definition-)
      "uint16 id
uint8 cmd_mode
uint16 cmd_data
float32 pos_estimate
float32 vel_estimate
float32  torque_estimate
float32 temp
")



(provide :drempower/state_msg "7e078fbada3d91b85209b327d5ded4f9")


