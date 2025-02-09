; Auto-generated. Do not edit!


(cl:in-package drempower-msg)


;//! \htmlinclude state_msg.msg.html

(cl:defclass <state_msg> (roslisp-msg-protocol:ros-message)
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
   (pos_estimate
    :reader pos_estimate
    :initarg :pos_estimate
    :type cl:float
    :initform 0.0)
   (vel_estimate
    :reader vel_estimate
    :initarg :vel_estimate
    :type cl:float
    :initform 0.0)
   (torque_estimate
    :reader torque_estimate
    :initarg :torque_estimate
    :type cl:float
    :initform 0.0)
   (temp
    :reader temp
    :initarg :temp
    :type cl:float
    :initform 0.0))
)

(cl:defclass state_msg (<state_msg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <state_msg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'state_msg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name drempower-msg:<state_msg> is deprecated: use drempower-msg:state_msg instead.")))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <state_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader drempower-msg:id-val is deprecated.  Use drempower-msg:id instead.")
  (id m))

(cl:ensure-generic-function 'cmd_mode-val :lambda-list '(m))
(cl:defmethod cmd_mode-val ((m <state_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader drempower-msg:cmd_mode-val is deprecated.  Use drempower-msg:cmd_mode instead.")
  (cmd_mode m))

(cl:ensure-generic-function 'cmd_data-val :lambda-list '(m))
(cl:defmethod cmd_data-val ((m <state_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader drempower-msg:cmd_data-val is deprecated.  Use drempower-msg:cmd_data instead.")
  (cmd_data m))

(cl:ensure-generic-function 'pos_estimate-val :lambda-list '(m))
(cl:defmethod pos_estimate-val ((m <state_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader drempower-msg:pos_estimate-val is deprecated.  Use drempower-msg:pos_estimate instead.")
  (pos_estimate m))

(cl:ensure-generic-function 'vel_estimate-val :lambda-list '(m))
(cl:defmethod vel_estimate-val ((m <state_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader drempower-msg:vel_estimate-val is deprecated.  Use drempower-msg:vel_estimate instead.")
  (vel_estimate m))

(cl:ensure-generic-function 'torque_estimate-val :lambda-list '(m))
(cl:defmethod torque_estimate-val ((m <state_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader drempower-msg:torque_estimate-val is deprecated.  Use drempower-msg:torque_estimate instead.")
  (torque_estimate m))

(cl:ensure-generic-function 'temp-val :lambda-list '(m))
(cl:defmethod temp-val ((m <state_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader drempower-msg:temp-val is deprecated.  Use drempower-msg:temp instead.")
  (temp m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <state_msg>) ostream)
  "Serializes a message object of type '<state_msg>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'cmd_mode)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'cmd_data)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'cmd_data)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'pos_estimate))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'vel_estimate))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'torque_estimate))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'temp))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <state_msg>) istream)
  "Deserializes a message object of type '<state_msg>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'cmd_mode)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'cmd_data)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'cmd_data)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'pos_estimate) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'vel_estimate) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'torque_estimate) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'temp) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<state_msg>)))
  "Returns string type for a message object of type '<state_msg>"
  "drempower/state_msg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'state_msg)))
  "Returns string type for a message object of type 'state_msg"
  "drempower/state_msg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<state_msg>)))
  "Returns md5sum for a message object of type '<state_msg>"
  "7e078fbada3d91b85209b327d5ded4f9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'state_msg)))
  "Returns md5sum for a message object of type 'state_msg"
  "7e078fbada3d91b85209b327d5ded4f9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<state_msg>)))
  "Returns full string definition for message of type '<state_msg>"
  (cl:format cl:nil "uint16 id~%uint8 cmd_mode~%uint16 cmd_data~%float32 pos_estimate~%float32 vel_estimate~%float32  torque_estimate~%float32 temp~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'state_msg)))
  "Returns full string definition for message of type 'state_msg"
  (cl:format cl:nil "uint16 id~%uint8 cmd_mode~%uint16 cmd_data~%float32 pos_estimate~%float32 vel_estimate~%float32  torque_estimate~%float32 temp~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <state_msg>))
  (cl:+ 0
     2
     1
     2
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <state_msg>))
  "Converts a ROS message object to a list"
  (cl:list 'state_msg
    (cl:cons ':id (id msg))
    (cl:cons ':cmd_mode (cmd_mode msg))
    (cl:cons ':cmd_data (cmd_data msg))
    (cl:cons ':pos_estimate (pos_estimate msg))
    (cl:cons ':vel_estimate (vel_estimate msg))
    (cl:cons ':torque_estimate (torque_estimate msg))
    (cl:cons ':temp (temp msg))
))
