// Generated by gencpp from file drempower/state_msg.msg
// DO NOT EDIT!


#ifndef DREMPOWER_MESSAGE_STATE_MSG_H
#define DREMPOWER_MESSAGE_STATE_MSG_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace drempower
{
template <class ContainerAllocator>
struct state_msg_
{
  typedef state_msg_<ContainerAllocator> Type;

  state_msg_()
    : id(0)
    , cmd_mode(0)
    , cmd_data(0)
    , pos_estimate(0.0)
    , vel_estimate(0.0)
    , torque_estimate(0.0)
    , temp(0.0)  {
    }
  state_msg_(const ContainerAllocator& _alloc)
    : id(0)
    , cmd_mode(0)
    , cmd_data(0)
    , pos_estimate(0.0)
    , vel_estimate(0.0)
    , torque_estimate(0.0)
    , temp(0.0)  {
  (void)_alloc;
    }



   typedef uint16_t _id_type;
  _id_type id;

   typedef uint8_t _cmd_mode_type;
  _cmd_mode_type cmd_mode;

   typedef uint16_t _cmd_data_type;
  _cmd_data_type cmd_data;

   typedef float _pos_estimate_type;
  _pos_estimate_type pos_estimate;

   typedef float _vel_estimate_type;
  _vel_estimate_type vel_estimate;

   typedef float _torque_estimate_type;
  _torque_estimate_type torque_estimate;

   typedef float _temp_type;
  _temp_type temp;





  typedef boost::shared_ptr< ::drempower::state_msg_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::drempower::state_msg_<ContainerAllocator> const> ConstPtr;

}; // struct state_msg_

typedef ::drempower::state_msg_<std::allocator<void> > state_msg;

typedef boost::shared_ptr< ::drempower::state_msg > state_msgPtr;
typedef boost::shared_ptr< ::drempower::state_msg const> state_msgConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::drempower::state_msg_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::drempower::state_msg_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::drempower::state_msg_<ContainerAllocator1> & lhs, const ::drempower::state_msg_<ContainerAllocator2> & rhs)
{
  return lhs.id == rhs.id &&
    lhs.cmd_mode == rhs.cmd_mode &&
    lhs.cmd_data == rhs.cmd_data &&
    lhs.pos_estimate == rhs.pos_estimate &&
    lhs.vel_estimate == rhs.vel_estimate &&
    lhs.torque_estimate == rhs.torque_estimate &&
    lhs.temp == rhs.temp;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::drempower::state_msg_<ContainerAllocator1> & lhs, const ::drempower::state_msg_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace drempower

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::drempower::state_msg_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::drempower::state_msg_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::drempower::state_msg_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::drempower::state_msg_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::drempower::state_msg_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::drempower::state_msg_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::drempower::state_msg_<ContainerAllocator> >
{
  static const char* value()
  {
    return "7e078fbada3d91b85209b327d5ded4f9";
  }

  static const char* value(const ::drempower::state_msg_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x7e078fbada3d91b8ULL;
  static const uint64_t static_value2 = 0x5209b327d5ded4f9ULL;
};

template<class ContainerAllocator>
struct DataType< ::drempower::state_msg_<ContainerAllocator> >
{
  static const char* value()
  {
    return "drempower/state_msg";
  }

  static const char* value(const ::drempower::state_msg_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::drempower::state_msg_<ContainerAllocator> >
{
  static const char* value()
  {
    return "uint16 id\n"
"uint8 cmd_mode\n"
"uint16 cmd_data\n"
"float32 pos_estimate\n"
"float32 vel_estimate\n"
"float32  torque_estimate\n"
"float32 temp\n"
;
  }

  static const char* value(const ::drempower::state_msg_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::drempower::state_msg_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.id);
      stream.next(m.cmd_mode);
      stream.next(m.cmd_data);
      stream.next(m.pos_estimate);
      stream.next(m.vel_estimate);
      stream.next(m.torque_estimate);
      stream.next(m.temp);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct state_msg_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::drempower::state_msg_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::drempower::state_msg_<ContainerAllocator>& v)
  {
    s << indent << "id: ";
    Printer<uint16_t>::stream(s, indent + "  ", v.id);
    s << indent << "cmd_mode: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.cmd_mode);
    s << indent << "cmd_data: ";
    Printer<uint16_t>::stream(s, indent + "  ", v.cmd_data);
    s << indent << "pos_estimate: ";
    Printer<float>::stream(s, indent + "  ", v.pos_estimate);
    s << indent << "vel_estimate: ";
    Printer<float>::stream(s, indent + "  ", v.vel_estimate);
    s << indent << "torque_estimate: ";
    Printer<float>::stream(s, indent + "  ", v.torque_estimate);
    s << indent << "temp: ";
    Printer<float>::stream(s, indent + "  ", v.temp);
  }
};

} // namespace message_operations
} // namespace ros

#endif // DREMPOWER_MESSAGE_STATE_MSG_H
