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

class state_msg {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.id = null;
      this.cmd_mode = null;
      this.cmd_data = null;
      this.pos_estimate = null;
      this.vel_estimate = null;
      this.torque_estimate = null;
      this.temp = null;
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
      if (initObj.hasOwnProperty('cmd_data')) {
        this.cmd_data = initObj.cmd_data
      }
      else {
        this.cmd_data = 0;
      }
      if (initObj.hasOwnProperty('pos_estimate')) {
        this.pos_estimate = initObj.pos_estimate
      }
      else {
        this.pos_estimate = 0.0;
      }
      if (initObj.hasOwnProperty('vel_estimate')) {
        this.vel_estimate = initObj.vel_estimate
      }
      else {
        this.vel_estimate = 0.0;
      }
      if (initObj.hasOwnProperty('torque_estimate')) {
        this.torque_estimate = initObj.torque_estimate
      }
      else {
        this.torque_estimate = 0.0;
      }
      if (initObj.hasOwnProperty('temp')) {
        this.temp = initObj.temp
      }
      else {
        this.temp = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type state_msg
    // Serialize message field [id]
    bufferOffset = _serializer.uint16(obj.id, buffer, bufferOffset);
    // Serialize message field [cmd_mode]
    bufferOffset = _serializer.uint8(obj.cmd_mode, buffer, bufferOffset);
    // Serialize message field [cmd_data]
    bufferOffset = _serializer.uint16(obj.cmd_data, buffer, bufferOffset);
    // Serialize message field [pos_estimate]
    bufferOffset = _serializer.float32(obj.pos_estimate, buffer, bufferOffset);
    // Serialize message field [vel_estimate]
    bufferOffset = _serializer.float32(obj.vel_estimate, buffer, bufferOffset);
    // Serialize message field [torque_estimate]
    bufferOffset = _serializer.float32(obj.torque_estimate, buffer, bufferOffset);
    // Serialize message field [temp]
    bufferOffset = _serializer.float32(obj.temp, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type state_msg
    let len;
    let data = new state_msg(null);
    // Deserialize message field [id]
    data.id = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [cmd_mode]
    data.cmd_mode = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [cmd_data]
    data.cmd_data = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [pos_estimate]
    data.pos_estimate = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [vel_estimate]
    data.vel_estimate = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [torque_estimate]
    data.torque_estimate = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [temp]
    data.temp = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 21;
  }

  static datatype() {
    // Returns string type for a message object
    return 'drempower/state_msg';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '7e078fbada3d91b85209b327d5ded4f9';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint16 id
    uint8 cmd_mode
    uint16 cmd_data
    float32 pos_estimate
    float32 vel_estimate
    float32  torque_estimate
    float32 temp
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new state_msg(null);
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

    if (msg.cmd_data !== undefined) {
      resolved.cmd_data = msg.cmd_data;
    }
    else {
      resolved.cmd_data = 0
    }

    if (msg.pos_estimate !== undefined) {
      resolved.pos_estimate = msg.pos_estimate;
    }
    else {
      resolved.pos_estimate = 0.0
    }

    if (msg.vel_estimate !== undefined) {
      resolved.vel_estimate = msg.vel_estimate;
    }
    else {
      resolved.vel_estimate = 0.0
    }

    if (msg.torque_estimate !== undefined) {
      resolved.torque_estimate = msg.torque_estimate;
    }
    else {
      resolved.torque_estimate = 0.0
    }

    if (msg.temp !== undefined) {
      resolved.temp = msg.temp;
    }
    else {
      resolved.temp = 0.0
    }

    return resolved;
    }
};

module.exports = state_msg;
