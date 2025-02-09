// Generated by gencpp from file drempower/SetServoAngle.msg
// DO NOT EDIT!


#ifndef DREMPOWER_MESSAGE_SETSERVOANGLE_H
#define DREMPOWER_MESSAGE_SETSERVOANGLE_H


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
struct SetServoAngle_
{
  typedef SetServoAngle_<ContainerAllocator> Type;

  SetServoAngle_()
    : id(0)
    , angle(0.0)
    , x(0.0)
    , y(0.0)
    , z(0.0)  {
    }
  SetServoAngle_(const ContainerAllocator& _alloc)
    : id(0)
    , angle(0.0)
    , x(0.0)
    , y(0.0)
    , z(0.0)  {
  (void)_alloc;
    }



   typedef uint8_t _id_type;
  _id_type id;

   typedef float _angle_type;
  _angle_type angle;

   typedef double _x_type;
  _x_type x;

   typedef double _y_type;
  _y_type y;

   typedef double _z_type;
  _z_type z;





  typedef boost::shared_ptr< ::drempower::SetServoAngle_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::drempower::SetServoAngle_<ContainerAllocator> const> ConstPtr;

}; // struct SetServoAngle_

typedef ::drempower::SetServoAngle_<std::allocator<void> > SetServoAngle;

typedef boost::shared_ptr< ::drempower::SetServoAngle > SetServoAnglePtr;
typedef boost::shared_ptr< ::drempower::SetServoAngle const> SetServoAngleConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::drempower::SetServoAngle_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::drempower::SetServoAngle_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::drempower::SetServoAngle_<ContainerAllocator1> & lhs, const ::drempower::SetServoAngle_<ContainerAllocator2> & rhs)
{
  return lhs.id == rhs.id &&
    lhs.angle == rhs.angle &&
    lhs.x == rhs.x &&
    lhs.y == rhs.y &&
    lhs.z == rhs.z;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::drempower::SetServoAngle_<ContainerAllocator1> & lhs, const ::drempower::SetServoAngle_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace drempower

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::drempower::SetServoAngle_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::drempower::SetServoAngle_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::drempower::SetServoAngle_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::drempower::SetServoAngle_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::drempower::SetServoAngle_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::drempower::SetServoAngle_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::drempower::SetServoAngle_<ContainerAllocator> >
{
  static const char* value()
  {
    return "7e2db3b2a44b9010fa914bf2531544ee";
  }

  static const char* value(const ::drempower::SetServoAngle_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x7e2db3b2a44b9010ULL;
  static const uint64_t static_value2 = 0xfa914bf2531544eeULL;
};

template<class ContainerAllocator>
struct DataType< ::drempower::SetServoAngle_<ContainerAllocator> >
{
  static const char* value()
  {
    return "drempower/SetServoAngle";
  }

  static const char* value(const ::drempower::SetServoAngle_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::drempower::SetServoAngle_<ContainerAllocator> >
{
  static const char* value()
  {
    return "uint8 id\n"
"float32 angle\n"
"float64 x\n"
"float64 y\n"
"float64 z\n"
;
  }

  static const char* value(const ::drempower::SetServoAngle_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::drempower::SetServoAngle_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.id);
      stream.next(m.angle);
      stream.next(m.x);
      stream.next(m.y);
      stream.next(m.z);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct SetServoAngle_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::drempower::SetServoAngle_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::drempower::SetServoAngle_<ContainerAllocator>& v)
  {
    s << indent << "id: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.id);
    s << indent << "angle: ";
    Printer<float>::stream(s, indent + "  ", v.angle);
    s << indent << "x: ";
    Printer<double>::stream(s, indent + "  ", v.x);
    s << indent << "y: ";
    Printer<double>::stream(s, indent + "  ", v.y);
    s << indent << "z: ";
    Printer<double>::stream(s, indent + "  ", v.z);
  }
};

} // namespace message_operations
} // namespace ros

#endif // DREMPOWER_MESSAGE_SETSERVOANGLE_H
