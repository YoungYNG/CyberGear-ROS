;; Auto-generated. Do not edit!


(when (boundp 'drempower::property_msg)
  (if (not (find-package "DREMPOWER"))
    (make-package "DREMPOWER"))
  (shadow 'property_msg (find-package "DREMPOWER")))
(unless (find-package "DREMPOWER::PROPERTY_MSG")
  (make-package "DREMPOWER::PROPERTY_MSG"))

(in-package "ROS")
;;//! \htmlinclude property_msg.msg.html


(defclass drempower::property_msg
  :super ros::object
  :slots (_id _cmd_mode _cmd_data _address _data_type _value ))

(defmethod drempower::property_msg
  (:init
   (&key
    ((:id __id) 0)
    ((:cmd_mode __cmd_mode) 0)
    ((:cmd_data __cmd_data) 0)
    ((:address __address) 0)
    ((:data_type __data_type) 0)
    ((:value __value) 0.0)
    )
   (send-super :init)
   (setq _id (round __id))
   (setq _cmd_mode (round __cmd_mode))
   (setq _cmd_data (round __cmd_data))
   (setq _address (round __address))
   (setq _data_type (round __data_type))
   (setq _value (float __value))
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
  (:address
   (&optional __address)
   (if __address (setq _address __address)) _address)
  (:data_type
   (&optional __data_type)
   (if __data_type (setq _data_type __data_type)) _data_type)
  (:value
   (&optional __value)
   (if __value (setq _value __value)) _value)
  (:serialization-length
   ()
   (+
    ;; uint8 _id
    1
    ;; uint8 _cmd_mode
    1
    ;; uint16 _cmd_data
    2
    ;; uint16 _address
    2
    ;; uint16 _data_type
    2
    ;; float32 _value
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
     ;; uint16 _cmd_data
       (write-word _cmd_data s)
     ;; uint16 _address
       (write-word _address s)
     ;; uint16 _data_type
       (write-word _data_type s)
     ;; float32 _value
       (sys::poke _value (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _id
     (setq _id (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _cmd_mode
     (setq _cmd_mode (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint16 _cmd_data
     (setq _cmd_data (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _address
     (setq _address (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _data_type
     (setq _data_type (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; float32 _value
     (setq _value (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get drempower::property_msg :md5sum-) "c56a37b89789465bc1a39487c8492c4f")
(setf (get drempower::property_msg :datatype-) "drempower/property_msg")
(setf (get drempower::property_msg :definition-)
      "uint8 id
uint8 cmd_mode
uint16 cmd_data
uint16 address
uint16 data_type
float32 value
")



(provide :drempower/property_msg "c56a37b89789465bc1a39487c8492c4f")


