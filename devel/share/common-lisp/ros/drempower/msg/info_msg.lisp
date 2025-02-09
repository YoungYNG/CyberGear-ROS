; Auto-generated. Do not edit!


(cl:in-package drempower-msg)


;//! \htmlinclude info_msg.msg.html

(cl:defclass <info_msg> (roslisp-msg-protocol:ros-message)
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
    :initform 0.0)
   (Pos
    :reader Pos
    :initarg :Pos
    :type cl:float
    :initform 0.0)
   (mode
    :reader mode
    :initarg :mode
    :type cl:string
    :initform ""))
)

(cl:defclass info_msg (<info_msg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <info_msg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'info_msg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name drempower-msg:<info_msg> is deprecated: use drempower-msg:info_msg instead.")))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <info_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader drempower-msg:id-val is deprecated.  Use drempower-msg:id instead.")
  (id m))

(cl:ensure-generic-function 'cmd_mode-val :lambda-list '(m))
(cl:defmethod cmd_mode-val ((m <info_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader drempower-msg:cmd_mode-val is deprecated.  Use drempower-msg:cmd_mode instead.")
  (cmd_mode m))

(cl:ensure-generic-function 'Vel-val :lambda-list '(m))
(cl:defmethod Vel-val ((m <info_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader drempower-msg:Vel-val is deprecated.  Use drempower-msg:Vel instead.")
  (Vel m))

(cl:ensure-generic-function 'limit_cur-val :lambda-list '(m))
(cl:defmethod limit_cur-val ((m <info_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader drempower-msg:limit_cur-val is deprecated.  Use drempower-msg:limit_cur instead.")
  (limit_cur m))

(cl:ensure-generic-function 'Pos-val :lambda-list '(m))
(cl:defmethod Pos-val ((m <info_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader drempower-msg:Pos-val is deprecated.  Use drempower-msg:Pos instead.")
  (Pos m))

(cl:ensure-generic-function 'mode-val :lambda-list '(m))
(cl:defmethod mode-val ((m <info_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader drempower-msg:mode-val is deprecated.  Use drempower-msg:mode instead.")
  (mode m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <info_msg>) ostream)
  "Serializes a message object of type '<info_msg>"
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
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'Pos))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'mode))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'mode))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <info_msg>) istream)
  "Deserializes a message object of type '<info_msg>"
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
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'Pos) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'mode) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'mode) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<info_msg>)))
  "Returns string type for a message object of type '<info_msg>"
  "drempower/info_msg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'info_msg)))
  "Returns string type for a message object of type 'info_msg"
  "drempower/info_msg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<info_msg>)))
  "Returns md5sum for a message object of type '<info_msg>"
  "d5122b929f7731dc84b5ea1e44fe06ee")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'info_msg)))
  "Returns md5sum for a message object of type 'info_msg"
  "d5122b929f7731dc84b5ea1e44fe06ee")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<info_msg>)))
  "Returns full string definition for message of type '<info_msg>"
  (cl:format cl:nil "uint8 id~%uint8 cmd_mode~%float32 Vel~%float32 limit_cur~%float32 Pos ~%string mode~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'info_msg)))
  "Returns full string definition for message of type 'info_msg"
  (cl:format cl:nil "uint8 id~%uint8 cmd_mode~%float32 Vel~%float32 limit_cur~%float32 Pos ~%string mode~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <info_msg>))
  (cl:+ 0
     1
     1
     4
     4
     4
     4 (cl:length (cl:slot-value msg 'mode))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <info_msg>))
  "Converts a ROS message object to a list"
  (cl:list 'info_msg
    (cl:cons ':id (id msg))
    (cl:cons ':cmd_mode (cmd_mode msg))
    (cl:cons ':Vel (Vel msg))
    (cl:cons ':limit_cur (limit_cur msg))
    (cl:cons ':Pos (Pos msg))
    (cl:cons ':mode (mode msg))
))
