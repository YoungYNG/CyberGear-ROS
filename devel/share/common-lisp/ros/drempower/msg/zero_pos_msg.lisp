; Auto-generated. Do not edit!


(cl:in-package drempower-msg)


;//! \htmlinclude zero_pos_msg.msg.html

(cl:defclass <zero_pos_msg> (roslisp-msg-protocol:ros-message)
  ((id
    :reader id
    :initarg :id
    :type cl:fixnum
    :initform 0)
   (cmd_mode
    :reader cmd_mode
    :initarg :cmd_mode
    :type cl:fixnum
    :initform 0))
)

(cl:defclass zero_pos_msg (<zero_pos_msg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <zero_pos_msg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'zero_pos_msg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name drempower-msg:<zero_pos_msg> is deprecated: use drempower-msg:zero_pos_msg instead.")))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <zero_pos_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader drempower-msg:id-val is deprecated.  Use drempower-msg:id instead.")
  (id m))

(cl:ensure-generic-function 'cmd_mode-val :lambda-list '(m))
(cl:defmethod cmd_mode-val ((m <zero_pos_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader drempower-msg:cmd_mode-val is deprecated.  Use drempower-msg:cmd_mode instead.")
  (cmd_mode m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <zero_pos_msg>) ostream)
  "Serializes a message object of type '<zero_pos_msg>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'cmd_mode)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <zero_pos_msg>) istream)
  "Deserializes a message object of type '<zero_pos_msg>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'cmd_mode)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<zero_pos_msg>)))
  "Returns string type for a message object of type '<zero_pos_msg>"
  "drempower/zero_pos_msg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'zero_pos_msg)))
  "Returns string type for a message object of type 'zero_pos_msg"
  "drempower/zero_pos_msg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<zero_pos_msg>)))
  "Returns md5sum for a message object of type '<zero_pos_msg>"
  "1052ee68e918215aa757f20d4ef4b17f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'zero_pos_msg)))
  "Returns md5sum for a message object of type 'zero_pos_msg"
  "1052ee68e918215aa757f20d4ef4b17f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<zero_pos_msg>)))
  "Returns full string definition for message of type '<zero_pos_msg>"
  (cl:format cl:nil "uint8 id~%uint8 cmd_mode~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'zero_pos_msg)))
  "Returns full string definition for message of type 'zero_pos_msg"
  (cl:format cl:nil "uint8 id~%uint8 cmd_mode~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <zero_pos_msg>))
  (cl:+ 0
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <zero_pos_msg>))
  "Converts a ROS message object to a list"
  (cl:list 'zero_pos_msg
    (cl:cons ':id (id msg))
    (cl:cons ':cmd_mode (cmd_mode msg))
))
