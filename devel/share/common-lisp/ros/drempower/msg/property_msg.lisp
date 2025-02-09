; Auto-generated. Do not edit!


(cl:in-package drempower-msg)


;//! \htmlinclude property_msg.msg.html

(cl:defclass <property_msg> (roslisp-msg-protocol:ros-message)
  ((id
    :reader id
    :initarg :id
    :type cl:fixnum
    :initform 0)
   (cmd_mode
    :reader cmd_mode
    :initarg :cmd_mode
    :type cl:fixnum
    :initform 0)
   (cmd_data
    :reader cmd_data
    :initarg :cmd_data
    :type cl:fixnum
    :initform 0)
   (address
    :reader address
    :initarg :address
    :type cl:fixnum
    :initform 0)
   (data_type
    :reader data_type
    :initarg :data_type
    :type cl:fixnum
    :initform 0)
   (value
    :reader value
    :initarg :value
    :type cl:float
    :initform 0.0))
)

(cl:defclass property_msg (<property_msg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <property_msg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'property_msg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name drempower-msg:<property_msg> is deprecated: use drempower-msg:property_msg instead.")))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <property_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader drempower-msg:id-val is deprecated.  Use drempower-msg:id instead.")
  (id m))

(cl:ensure-generic-function 'cmd_mode-val :lambda-list '(m))
(cl:defmethod cmd_mode-val ((m <property_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader drempower-msg:cmd_mode-val is deprecated.  Use drempower-msg:cmd_mode instead.")
  (cmd_mode m))

(cl:ensure-generic-function 'cmd_data-val :lambda-list '(m))
(cl:defmethod cmd_data-val ((m <property_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader drempower-msg:cmd_data-val is deprecated.  Use drempower-msg:cmd_data instead.")
  (cmd_data m))

(cl:ensure-generic-function 'address-val :lambda-list '(m))
(cl:defmethod address-val ((m <property_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader drempower-msg:address-val is deprecated.  Use drempower-msg:address instead.")
  (address m))

(cl:ensure-generic-function 'data_type-val :lambda-list '(m))
(cl:defmethod data_type-val ((m <property_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader drempower-msg:data_type-val is deprecated.  Use drempower-msg:data_type instead.")
  (data_type m))

(cl:ensure-generic-function 'value-val :lambda-list '(m))
(cl:defmethod value-val ((m <property_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader drempower-msg:value-val is deprecated.  Use drempower-msg:value instead.")
  (value m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <property_msg>) ostream)
  "Serializes a message object of type '<property_msg>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'cmd_mode)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'cmd_data)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'cmd_data)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'address)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'address)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'data_type)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'data_type)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'value))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <property_msg>) istream)
  "Deserializes a message object of type '<property_msg>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'cmd_mode)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'cmd_data)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'cmd_data)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'address)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'address)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'data_type)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'data_type)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'value) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<property_msg>)))
  "Returns string type for a message object of type '<property_msg>"
  "drempower/property_msg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'property_msg)))
  "Returns string type for a message object of type 'property_msg"
  "drempower/property_msg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<property_msg>)))
  "Returns md5sum for a message object of type '<property_msg>"
  "c56a37b89789465bc1a39487c8492c4f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'property_msg)))
  "Returns md5sum for a message object of type 'property_msg"
  "c56a37b89789465bc1a39487c8492c4f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<property_msg>)))
  "Returns full string definition for message of type '<property_msg>"
  (cl:format cl:nil "uint8 id~%uint8 cmd_mode~%uint16 cmd_data~%uint16 address~%uint16 data_type~%float32 value~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'property_msg)))
  "Returns full string definition for message of type 'property_msg"
  (cl:format cl:nil "uint8 id~%uint8 cmd_mode~%uint16 cmd_data~%uint16 address~%uint16 data_type~%float32 value~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <property_msg>))
  (cl:+ 0
     1
     1
     2
     2
     2
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <property_msg>))
  "Converts a ROS message object to a list"
  (cl:list 'property_msg
    (cl:cons ':id (id msg))
    (cl:cons ':cmd_mode (cmd_mode msg))
    (cl:cons ':cmd_data (cmd_data msg))
    (cl:cons ':address (address msg))
    (cl:cons ':data_type (data_type msg))
    (cl:cons ':value (value msg))
))
