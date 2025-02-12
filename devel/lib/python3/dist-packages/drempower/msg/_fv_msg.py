# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from drempower/fv_msg.msg. Do not edit."""
import codecs
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct


class fv_msg(genpy.Message):
  _md5sum = "ac95f8c594785dbf2c534cdd6f9f2d09"
  _type = "drempower/fv_msg"
  _has_header = False  # flag to mark the presence of a Header object
  _full_text = """uint8 id
uint8 cmd_mode
float32 Vel
float32 limit_cur

"""
  __slots__ = ['id','cmd_mode','Vel','limit_cur']
  _slot_types = ['uint8','uint8','float32','float32']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       id,cmd_mode,Vel,limit_cur

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(fv_msg, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.id is None:
        self.id = 0
      if self.cmd_mode is None:
        self.cmd_mode = 0
      if self.Vel is None:
        self.Vel = 0.
      if self.limit_cur is None:
        self.limit_cur = 0.
    else:
      self.id = 0
      self.cmd_mode = 0
      self.Vel = 0.
      self.limit_cur = 0.

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      _x = self
      buff.write(_get_struct_2B2f().pack(_x.id, _x.cmd_mode, _x.Vel, _x.limit_cur))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    if python3:
      codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      end = 0
      _x = self
      start = end
      end += 10
      (_x.id, _x.cmd_mode, _x.Vel, _x.limit_cur,) = _get_struct_2B2f().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      _x = self
      buff.write(_get_struct_2B2f().pack(_x.id, _x.cmd_mode, _x.Vel, _x.limit_cur))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    if python3:
      codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      end = 0
      _x = self
      start = end
      end += 10
      (_x.id, _x.cmd_mode, _x.Vel, _x.limit_cur,) = _get_struct_2B2f().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_2B2f = None
def _get_struct_2B2f():
    global _struct_2B2f
    if _struct_2B2f is None:
        _struct_2B2f = struct.Struct("<2B2f")
    return _struct_2B2f
