// Generated by gencpp from file drempower/info_msg.msg
// DO NOT EDIT!


#ifndef DREMPOWER_MESSAGE_INFO_MSG_H
#define DREMPOWER_MESSAGE_INFO_MSG_H


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
struct info_msg_
{
  typedef info_msg_<ContainerAllocator> Type;

  info_msg_()
    : id(0)
    , cmd_mode(0)
    , Vel(0.0)
    , limit_cur(0.0)
    , Pos(0.0)
    , mode()  {
    }
  info_msg_(const ContainerAllocator& _alloc)
    : id(0)
    , cmd_mode(0)
    , Vel(0.0)
    , limit_cur(0.0)
    , Pos(0.0)
    , mode(_alloc)  {
  (void)_alloc;
    }



   typedef uint8_t _id_type;
  _id_type id;

   typedef uint8_t _cmd_mode_type;
  _cmd_mode_type cmd_mode;

   typedef float _Vel_type;
  _Vel_type Vel;

   typedef float _limit_cur_type;
  _limit_cur_type limit_cur;

   typedef float _Pos_type;
  _Pos_type Pos;

   typedef std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>> _mode_type;
  _mode_type mode;





  typedef boost::shared_ptr< ::drempower::info_msg_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::drempower::info_msg_<ContainerAllocator> const> ConstPtr;

}; // struct info_msg_

typedef ::drempower::info_msg_<std::allocator<void> > info_msg;

typedef boost::shared_ptr< ::drempower::info_msg > info_msgPtr;
typedef boost::shared_ptr< ::drempower::info_msg const> info_msgConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::drempower::info_msg_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::drempower::info_msg_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::drempower::info_msg_<ContainerAllocator1> & lhs, const ::drempower::info_msg_<ContainerAllocator2> & rhs)
{
  return lhs.id == rhs.id &&
    lhs.cmd_mode == rhs.cmd_mode &&
    lhs.Vel == rhs.Vel &&
    lhs.limit_cur == rhs.limit_cur &&
    lhs.Pos == rhs.Pos &&
    lhs.mode == rhs.mode;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::drempower::info_msg_<ContainerAllocator1> & lhs, const ::drempower::info_msg_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace drempower

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::drempower::info_msg_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::drempower::info_msg_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::drempower::info_msg_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::drempower::info_msg_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::drempower::info_msg_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::drempower::info_msg_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::drempower::info_msg_<ContainerAllocator> >
{
  static const char* value()
  {
    return "d5122b929f7731dc84b5ea1e44fe06ee";
  }

  static const char* value(const ::drempower::info_msg_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xd5122b929f7731dcULL;
  static const uint64_t static_value2 = 0x84b5ea1e44fe06eeULL;
};

template<class ContainerAllocator>
struct DataType< ::drempower::info_msg_<ContainerAllocator> >
{
  static const char* value()
  {
    return "drempower/info_msg";
  }

  static const char* value(const ::drempower::info_msg_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::drempower::info_msg_<ContainerAllocator> >
{
  static const char* value()
  {
    return "uint8 id\n"
"uint8 cmd_mode\n"
"float32 Vel\n"
"float32 limit_cur\n"
"float32 Pos \n"
"string mode\n"
;
  }

  static const char* value(const ::drempower::info_msg_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::drempower::info_msg_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.id);
      stream.next(m.cmd_mode);
      stream.next(m.Vel);
      stream.next(m.limit_cur);
      stream.next(m.Pos);
      stream.next(m.mode);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct info_msg_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::drempower::info_msg_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::drempower::info_msg_<ContainerAllocator>& v)
  {
    s << indent << "id: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.id);
    s << indent << "cmd_mode: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.cmd_mode);
    s << indent << "Vel: ";
    Printer<float>::stream(s, indent + "  ", v.Vel);
    s << indent << "limit_cur: ";
    Printer<float>::stream(s, indent + "  ", v.limit_cur);
    s << indent << "Pos: ";
    Printer<float>::stream(s, indent + "  ", v.Pos);
    s << indent << "mode: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>>::stream(s, indent + "  ", v.mode);
  }
};

} // namespace message_operations
} // namespace ros

#endif // DREMPOWER_MESSAGE_INFO_MSG_H
