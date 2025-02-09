// Auto-generated. Do not edit!

// (in-package drempower.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class info_msg {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.id = null;
      this.cmd_mode = null;
      this.Vel = null;
      this.limit_cur = null;
      this.Pos = null;
      this.mode = null;
    }
    else {
      if (initObj.hasOwnProperty('id')) {
        this.id = initObj.id
      }
      else {
        this.id = 0;
      }
      if (initObj.hasOwnProperty('cmd_mode')) {
        this.cmd_mode = initObj.cmd_mode
      }
      else {
        this.cmd_mode = 0;
      }
      if (initObj.hasOwnProperty('Vel')) {
        this.Vel = initObj.Vel
      }
      else {
        this.Vel = 0.0;
      }
      if (initObj.hasOwnProperty('limit_cur')) {
        this.limit_cur = initObj.limit_cur
      }
      else {
        this.limit_cur = 0.0;
      }
      if (initObj.hasOwnProperty('Pos')) {
        this.Pos = initObj.Pos
      }
      else {
        this.Pos = 0.0;
      }
      if (initObj.hasOwnProperty('mode')) {
        this.mode = initObj.mode
      }
      else {
        this.mode = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type info_msg
    // Serialize message field [id]
    bufferOffset = _serializer.uint8(obj.id, buffer, bufferOffset);
    // Serialize message field [cmd_mode]
    bufferOffset = _serializer.uint8(obj.cmd_mode, buffer, bufferOffset);
    // Serialize message field [Vel]
    bufferOffset = _serializer.float32(obj.Vel, buffer, bufferOffset);
    // Serialize message field [limit_cur]
    bufferOffset = _serializer.float32(obj.limit_cur, buffer, bufferOffset);
    // Serialize message field [Pos]
    bufferOffset = _serializer.float32(obj.Pos, buffer, bufferOffset);
    // Serialize message field [mode]
    bufferOffset = _serializer.string(obj.mode, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type info_msg
    let len;
    let data = new info_msg(null);
    // Deserialize message field [id]
    data.id = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [cmd_mode]
    data.cmd_mode = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [Vel]
    data.Vel = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [limit_cur]
    data.limit_cur = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [Pos]
    data.Pos = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [mode]
    data.mode = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.mode);
    return length + 18;
  }

  static datatype() {
    // Returns string type for a message object
    return 'drempower/info_msg';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd5122b929f7731dc84b5ea1e44fe06ee';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint8 id
    uint8 cmd_mode
    float32 Vel
    float32 limit_cur
    float32 Pos 
    string mode
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new info_msg(null);
    if (msg.id !== undefined) {
      resolved.id = msg.id;
    }
    else {
      resolved.id = 0
    }

    if (msg.cmd_mode !== undefined) {
      resolved.cmd_mode = msg.cmd_mode;
    }
    else {
      resolved.cmd_mode = 0
    }

    if (msg.Vel !== undefined) {
      resolved.Vel = msg.Vel;
    }
    else {
      resolved.Vel = 0.0
    }

    if (msg.limit_cur !== undefined) {
      resolved.limit_cur = msg.limit_cur;
    }
    else {
      resolved.limit_cur = 0.0
    }

    if (msg.Pos !== undefined) {
      resolved.Pos = msg.Pos;
    }
    else {
      resolved.Pos = 0.0
    }

    if (msg.mode !== undefined) {
      resolved.mode = msg.mode;
    }
    else {
      resolved.mode = ''
    }

    return resolved;
    }
};

module.exports = info_msg;
