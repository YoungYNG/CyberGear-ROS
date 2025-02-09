; Auto-generated. Do not edit!


(cl:in-package drempower-msg)


;//! \htmlinclude fv_msg.msg.html

(cl:defclass <fv_msg> (roslisp-msg-protocol:ros-message)
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
   (Vel
    :reader Vel
    :initarg :Vel
    :type cl:float
    :initform 0.0)
   (limit_cur
    :reader limit_cur
    :initarg :limit_cur
    :type cl:float
    :initform 0.0))
)

(cl:defclass fv_msg (<fv_msg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <fv_msg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'fv_msg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name drempower-msg:<fv_msg> is deprecated: use drempower-msg:fv_msg instead.")))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <fv_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader drempower-msg:id-val is deprecated.  Use drempower-msg:id instead.")
  (id m))

(cl:ensure-generic-function 'cmd_mode-val :lambda-list '(m))
(cl:defmethod cmd_mode-val ((m <fv_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader drempower-msg:cmd_mode-val is deprecated.  Use drempower-msg:cmd_mode instead.")
  (cmd_mode m))

(cl:ensure-generic-function 'Vel-val :lambda-list '(m))
(cl:defmethod Vel-val ((m <fv_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader drempower-msg:Vel-val is deprecated.  Use drempower-msg:Vel instead.")
  (Vel m))

(cl:ensure-generic-function 'limit_cur-val :lambda-list '(m))
(cl:defmethod limit_cur-val ((m <fv_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader drempower-msg:limit_cur-val is deprecated.  Use drempower-msg:limit_cur instead.")
  (limit_cur m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <fv_msg>) ostream)
  "Serializes a message object of type '<fv_msg>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'cmd_mode)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'Vel))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'limit_cur))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <fv_msg>) istream)
  "Deserializes a message object of type '<fv_msg>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'cmd_mode)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'Vel) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'limit_cur) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<fv_msg>)))
  "Returns string type for a message object of type '<fv_msg>"
  "drempower/fv_msg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'fv_msg)))
  "Returns string type for a message object of type 'fv_msg"
  "drempower/fv_msg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<fv_msg>)))
  "Returns md5sum for a message object of type '<fv_msg>"
  "ac95f8c594785dbf2c534cdd6f9f2d09")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'fv_msg)))
  "Returns md5sum for a message object of type 'fv_msg"
  "ac95f8c594785dbf2c534cdd6f9f2d09")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<fv_msg>)))
  "Returns full string definition for message of type '<fv_msg>"
  (cl:format cl:nil "uint8 id~%uint8 cmd_mode~%float32 Vel~%float32 limit_cur~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'fv_msg)))
  "Returns full string definition for message of type 'fv_msg"
  (cl:format cl:nil "uint8 id~%uint8 cmd_mode~%float32 Vel~%float32 limit_cur~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <fv_msg>))
  (cl:+ 0
     1
     1
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <fv_msg>))
  "Converts a ROS message object to a list"
  (cl:list 'fv_msg
    (cl:cons ':id (id msg))
    (cl:cons ':cmd_mode (cmd_mode msg))
    (cl:cons ':Vel (Vel msg))
    (cl:cons ':limit_cur (limit_cur msg))
))
