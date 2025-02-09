; Auto-generated. Do not edit!


(cl:in-package drempower-msg)


;//! \htmlinclude ft_msg.msg.html

(cl:defclass <ft_msg> (roslisp-msg-protocol:ros-message)
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
   (torque
    :reader torque
    :initarg :torque
    :type cl:float
    :initform 0.0))
)

(cl:defclass ft_msg (<ft_msg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ft_msg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ft_msg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name drempower-msg:<ft_msg> is deprecated: use drempower-msg:ft_msg instead.")))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <ft_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader drempower-msg:id-val is deprecated.  Use drempower-msg:id instead.")
  (id m))

(cl:ensure-generic-function 'cmd_mode-val :lambda-list '(m))
(cl:defmethod cmd_mode-val ((m <ft_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader drempower-msg:cmd_mode-val is deprecated.  Use drempower-msg:cmd_mode instead.")
  (cmd_mode m))

(cl:ensure-generic-function 'torque-val :lambda-list '(m))
(cl:defmethod torque-val ((m <ft_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader drempower-msg:torque-val is deprecated.  Use drempower-msg:torque instead.")
  (torque m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ft_msg>) ostream)
  "Serializes a message object of type '<ft_msg>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'cmd_mode)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'torque))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ft_msg>) istream)
  "Deserializes a message object of type '<ft_msg>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'cmd_mode)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'torque) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ft_msg>)))
  "Returns string type for a message object of type '<ft_msg>"
  "drempower/ft_msg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ft_msg)))
  "Returns string type for a message object of type 'ft_msg"
  "drempower/ft_msg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ft_msg>)))
  "Returns md5sum for a message object of type '<ft_msg>"
  "ebe2a773be5d177c183b7b4f0377a6a2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ft_msg)))
  "Returns md5sum for a message object of type 'ft_msg"
  "ebe2a773be5d177c183b7b4f0377a6a2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ft_msg>)))
  "Returns full string definition for message of type '<ft_msg>"
  (cl:format cl:nil "uint8 id~%uint8 cmd_mode~%float32 torque~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ft_msg)))
  "Returns full string definition for message of type 'ft_msg"
  (cl:format cl:nil "uint8 id~%uint8 cmd_mode~%float32 torque~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ft_msg>))
  (cl:+ 0
     1
     1
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ft_msg>))
  "Converts a ROS message object to a list"
  (cl:list 'ft_msg
    (cl:cons ':id (id msg))
    (cl:cons ':cmd_mode (cmd_mode msg))
    (cl:cons ':torque (torque msg))
))
