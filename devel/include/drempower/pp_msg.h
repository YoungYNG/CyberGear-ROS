// Generated by gencpp from file drempower/pp_msg.msg
// DO NOT EDIT!


#ifndef DREMPOWER_MESSAGE_PP_MSG_H
#define DREMPOWER_MESSAGE_PP_MSG_H


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
struct pp_msg_
{
  typedef pp_msg_<ContainerAllocator> Type;

  pp_msg_()
    : id(0)
    , cmd_mode(0)
    , Pos(0.0)
    , Vel(0.0)
    , limit_cur(0.0)  {
    }
  pp_msg_(const ContainerAllocator& _alloc)
    : id(0)
    , cmd_mode(0)
    , Pos(0.0)
    , Vel(0.0)
    , limit_cur(0.0)  {
  (void)_alloc;
    }



   typedef uint8_t _id_type;
  _id_type id;

   typedef uint8_t _cmd_mode_type;
  _cmd_mode_type cmd_mode;

   typedef float _Pos_type;
  _Pos_type Pos;

   typedef float _Vel_type;
  _Vel_type Vel;

   typedef float _limit_cur_type;
  _limit_cur_type limit_cur;





  typedef boost::shared_ptr< ::drempower::pp_msg_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::drempower::pp_msg_<ContainerAllocator> const> ConstPtr;

}; // struct pp_msg_

typedef ::drempower::pp_msg_<std::allocator<void> > pp_msg;

typedef boost::shared_ptr< ::drempower::pp_msg > pp_msgPtr;
typedef boost::shared_ptr< ::drempower::pp_msg const> pp_msgConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::drempower::pp_msg_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::drempower::pp_msg_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::drempower::pp_msg_<ContainerAllocator1> & lhs, const ::drempower::pp_msg_<ContainerAllocator2> & rhs)
{
  return lhs.id == rhs.id &&
    lhs.cmd_mode == rhs.cmd_mode &&
    lhs.Pos == rhs.Pos &&
    lhs.Vel == rhs.Vel &&
    lhs.limit_cur == rhs.limit_cur;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::drempower::pp_msg_<ContainerAllocator1> & lhs, const ::drempower::pp_msg_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace drempower

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::drempower::pp_msg_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::drempower::pp_msg_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::drempower::pp_msg_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::drempower::pp_msg_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::drempower::pp_msg_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::drempower::pp_msg_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::drempower::pp_msg_<ContainerAllocator> >
{
  static const char* value()
  {
    return "d3650ef04ac1ce7a9c0baf8aae3941a1";
  }

  static const char* value(const ::drempower::pp_msg_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xd3650ef04ac1ce7aULL;
  static const uint64_t static_value2 = 0x9c0baf8aae3941a1ULL;
};

template<class ContainerAllocator>
struct DataType< ::drempower::pp_msg_<ContainerAllocator> >
{
  static const char* value()
  {
    return "drempower/pp_msg";
  }

  static const char* value(const ::drempower::pp_msg_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::drempower::pp_msg_<ContainerAllocator> >
{
  static const char* value()
  {
    return "uint8 id\n"
"uint8 cmd_mode\n"
"float32 Pos \n"
"float32 Vel\n"
"float32 limit_cur\n"
;
  }

  static const char* value(const ::drempower::pp_msg_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::drempower::pp_msg_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.id);
      stream.next(m.cmd_mode);
      stream.next(m.Pos);
      stream.next(m.Vel);
      stream.next(m.limit_cur);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct pp_msg_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::drempower::pp_msg_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::drempower::pp_msg_<ContainerAllocator>& v)
  {
    s << indent << "id: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.id);
    s << indent << "cmd_mode: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.cmd_mode);
    s << indent << "Pos: ";
    Printer<float>::stream(s, indent + "  ", v.Pos);
    s << indent << "Vel: ";
    Printer<float>::stream(s, indent + "  ", v.Vel);
    s << indent << "limit_cur: ";
    Printer<float>::stream(s, indent + "  ", v.limit_cur);
  }
};

} // namespace message_operations
} // namespace ros

#endif // DREMPOWER_MESSAGE_PP_MSG_H
