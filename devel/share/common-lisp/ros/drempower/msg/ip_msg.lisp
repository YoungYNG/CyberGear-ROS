; Auto-generated. Do not edit!


(cl:in-package drempower-msg)


;//! \htmlinclude ip_msg.msg.html

(cl:defclass <ip_msg> (roslisp-msg-protocol:ros-message)
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
    :initform 0.0)
   (Pos
    :reader Pos
    :initarg :Pos
    :type cl:float
    :initform 0.0)
   (speed
    :reader speed
    :initarg :speed
    :type cl:float
    :initform 0.0)
   (kp
    :reader kp
    :initarg :kp
    :type cl:float
    :initform 0.0)
   (kd
    :reader kd
    :initarg :kd
    :type cl:float
    :initform 0.0))
)

(cl:defclass ip_msg (<ip_msg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ip_msg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ip_msg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name drempower-msg:<ip_msg> is deprecated: use drempower-msg:ip_msg instead.")))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <ip_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader drempower-msg:id-val is deprecated.  Use drempower-msg:id instead.")
  (id m))

(cl:ensure-generic-function 'cmd_mode-val :lambda-list '(m))
(cl:defmethod cmd_mode-val ((m <ip_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader drempower-msg:cmd_mode-val is deprecated.  Use drempower-msg:cmd_mode instead.")
  (cmd_mode m))

(cl:ensure-generic-function 'torque-val :lambda-list '(m))
(cl:defmethod torque-val ((m <ip_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader drempower-msg:torque-val is deprecated.  Use drempower-msg:torque instead.")
  (torque m))

(cl:ensure-generic-function 'Pos-val :lambda-list '(m))
(cl:defmethod Pos-val ((m <ip_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader drempower-msg:Pos-val is deprecated.  Use drempower-msg:Pos instead.")
  (Pos m))

(cl:ensure-generic-function 'speed-val :lambda-list '(m))
(cl:defmethod speed-val ((m <ip_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader drempower-msg:speed-val is deprecated.  Use drempower-msg:speed instead.")
  (speed m))

(cl:ensure-generic-function 'kp-val :lambda-list '(m))
(cl:defmethod kp-val ((m <ip_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader drempower-msg:kp-val is deprecated.  Use drempower-msg:kp instead.")
  (kp m))

(cl:ensure-generic-function 'kd-val :lambda-list '(m))
(cl:defmethod kd-val ((m <ip_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader drempower-msg:kd-val is deprecated.  Use drempower-msg:kd instead.")
  (kd m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ip_msg>) ostream)
  "Serializes a message object of type '<ip_msg>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'cmd_mode)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'torque))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'Pos))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'speed))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'kp))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'kd))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ip_msg>) istream)
  "Deserializes a message object of type '<ip_msg>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'cmd_mode)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'torque) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'Pos) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'speed) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'kp) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'kd) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ip_msg>)))
  "Returns string type for a message object of type '<ip_msg>"
  "drempower/ip_msg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ip_msg)))
  "Returns string type for a message object of type 'ip_msg"
  "drempower/ip_msg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ip_msg>)))
  "Returns md5sum for a message object of type '<ip_msg>"
  "8d3fd0cf5bc3255fd077802cc1d02666")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ip_msg)))
  "Returns md5sum for a message object of type 'ip_msg"
  "8d3fd0cf5bc3255fd077802cc1d02666")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ip_msg>)))
  "Returns full string definition for message of type '<ip_msg>"
  (cl:format cl:nil "uint8 id~%uint8 cmd_mode~%float32 torque ~%float32 Pos ~%float32 speed ~%float32 kp ~%float32 kd ~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ip_msg)))
  "Returns full string definition for message of type 'ip_msg"
  (cl:format cl:nil "uint8 id~%uint8 cmd_mode~%float32 torque ~%float32 Pos ~%float32 speed ~%float32 kp ~%float32 kd ~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ip_msg>))
  (cl:+ 0
     1
     1
     4
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ip_msg>))
  "Converts a ROS message object to a list"
  (cl:list 'ip_msg
    (cl:cons ':id (id msg))
    (cl:cons ':cmd_mode (cmd_mode msg))
    (cl:cons ':torque (torque msg))
    (cl:cons ':Pos (Pos msg))
    (cl:cons ':speed (speed msg))
    (cl:cons ':kp (kp msg))
    (cl:cons ':kd (kd msg))
))
