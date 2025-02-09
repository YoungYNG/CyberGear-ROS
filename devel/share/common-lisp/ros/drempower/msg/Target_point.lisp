; Auto-generated. Do not edit!


(cl:in-package drempower-msg)


;//! \htmlinclude Target_point.msg.html

(cl:defclass <Target_point> (roslisp-msg-protocol:ros-message)
  ((x
    :reader x
    :initarg :x
    :type cl:float
    :initform 0.0)
   (y
    :reader y
    :initarg :y
    :type cl:float
    :initform 0.0)
   (motion
    :reader motion
    :initarg :motion
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass Target_point (<Target_point>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Target_point>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Target_point)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name drempower-msg:<Target_point> is deprecated: use drempower-msg:Target_point instead.")))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <Target_point>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader drempower-msg:x-val is deprecated.  Use drempower-msg:x instead.")
  (x m))

(cl:ensure-generic-function 'y-val :lambda-list '(m))
(cl:defmethod y-val ((m <Target_point>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader drempower-msg:y-val is deprecated.  Use drempower-msg:y instead.")
  (y m))

(cl:ensure-generic-function 'motion-val :lambda-list '(m))
(cl:defmethod motion-val ((m <Target_point>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader drempower-msg:motion-val is deprecated.  Use drempower-msg:motion instead.")
  (motion m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Target_point>) ostream)
  "Serializes a message object of type '<Target_point>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'motion) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Target_point>) istream)
  "Deserializes a message object of type '<Target_point>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'x) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'y) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:slot-value msg 'motion) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Target_point>)))
  "Returns string type for a message object of type '<Target_point>"
  "drempower/Target_point")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Target_point)))
  "Returns string type for a message object of type 'Target_point"
  "drempower/Target_point")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Target_point>)))
  "Returns md5sum for a message object of type '<Target_point>"
  "943eefa7a7b753a3f2176e70f130d3b3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Target_point)))
  "Returns md5sum for a message object of type 'Target_point"
  "943eefa7a7b753a3f2176e70f130d3b3")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Target_point>)))
  "Returns full string definition for message of type '<Target_point>"
  (cl:format cl:nil "float32 x~%float32 y~%bool motion~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Target_point)))
  "Returns full string definition for message of type 'Target_point"
  (cl:format cl:nil "float32 x~%float32 y~%bool motion~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Target_point>))
  (cl:+ 0
     4
     4
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Target_point>))
  "Converts a ROS message object to a list"
  (cl:list 'Target_point
    (cl:cons ':x (x msg))
    (cl:cons ':y (y msg))
    (cl:cons ':motion (motion msg))
))
