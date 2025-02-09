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

class property_msg {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.id = null;
      this.cmd_mode = null;
      this.cmd_data = null;
      this.address = null;
      this.data_type = null;
      this.value = null;
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
      if (initObj.hasOwnProperty('address')) {
        this.address = initObj.address
      }
      else {
        this.address = 0;
      }
      if (initObj.hasOwnProperty('data_type')) {
        this.data_type = initObj.data_type
      }
      else {
        this.data_type = 0;
      }
      if (initObj.hasOwnProperty('value')) {
        this.value = initObj.value
      }
      else {
        this.value = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type property_msg
    // Serialize message field [id]
    bufferOffset = _serializer.uint8(obj.id, buffer, bufferOffset);
    // Serialize message field [cmd_mode]
    bufferOffset = _serializer.uint8(obj.cmd_mode, buffer, bufferOffset);
    // Serialize message field [cmd_data]
    bufferOffset = _serializer.uint16(obj.cmd_data, buffer, bufferOffset);
    // Serialize message field [address]
    bufferOffset = _serializer.uint16(obj.address, buffer, bufferOffset);
    // Serialize message field [data_type]
    bufferOffset = _serializer.uint16(obj.data_type, buffer, bufferOffset);
    // Serialize message field [value]
    bufferOffset = _serializer.float32(obj.value, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type property_msg
    let len;
    let data = new property_msg(null);
    // Deserialize message field [id]
    data.id = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [cmd_mode]
    data.cmd_mode = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [cmd_data]
    data.cmd_data = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [address]
    data.address = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [data_type]
    data.data_type = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [value]
    data.value = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 12;
  }

  static datatype() {
    // Returns string type for a message object
    return 'drempower/property_msg';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'c56a37b89789465bc1a39487c8492c4f';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint8 id
    uint8 cmd_mode
    uint16 cmd_data
    uint16 address
    uint16 data_type
    float32 value
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new property_msg(null);
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

    if (msg.address !== undefined) {
      resolved.address = msg.address;
    }
    else {
      resolved.address = 0
    }

    if (msg.data_type !== undefined) {
      resolved.data_type = msg.data_type;
    }
    else {
      resolved.data_type = 0
    }

    if (msg.value !== undefined) {
      resolved.value = msg.value;
    }
    else {
      resolved.value = 0.0
    }

    return resolved;
    }
};

module.exports = property_msg;
