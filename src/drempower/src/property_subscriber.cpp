#include "ros/ros.h"
#include "can_msgs/Frame.h"
#include <sstream>
#include "format_data.h"
#include "drempower/property_msg.h"

ros::Publisher can_msg_pub;
ros::Publisher property_msg_pub1;
ros::Publisher property_msg_pub2;
ros::Publisher property_msg_pub3;

can_msgs::Frame t_message;

struct exCanIdInfo{
uint32_t id:8;
uint32_t data:16;
uint32_t mode:5;
uint32_t res:3;
};

#define txCanIdEx (((struct exCanIdInfo*)&(t_message.id)))


void ReadProperyCallback(const drempower::property_msg &msg)
{
     uint16_t master_id = 0;
     t_message.dlc = 8;
     t_message.is_extended = true;
     txCanIdEx->mode = msg.cmd_mode;
     txCanIdEx->id = msg.id;
     txCanIdEx->res = 0;
     txCanIdEx->data = master_id;
     uint16_to_data(msg.address, &t_message.data[0]);

     if (msg.address < 0x7000)
          txCanIdEx->mode = 9;

     can_msg_pub.publish(t_message);
     ROS_INFO("read_property_node:[%d,%d,%d]", msg.id, msg.address, msg.data_type);
}

void WriteProperyCallback(const drempower::property_msg &msg)
{
     ROS_INFO("write_property_node:[%d,%d,%d,%d,%f]", msg.id, msg.cmd_mode, msg.address, msg.data_type, msg.value);
     t_message.dlc = 8;
     uint16_t master_id = 0;
     t_message.is_extended = true;
     txCanIdEx->mode = msg.cmd_mode;
     txCanIdEx->id = msg.id;
     txCanIdEx->res = 0;
     txCanIdEx->data = master_id;
     uint16_to_data(msg.address, &t_message.data[0]);//Byte0~1:index  Byte2~3:00  Byte4~7:.参数数据

     if (msg.address < 0x7000 && msg.address >= 0x010)  //这一段令我比较疑惑
          txCanIdEx->mode = 8;

     switch (msg.data_type)//转换数据类型，有的数据是整形，有的是浮点型
     {
     case 0:
          float_to_data(msg.value, &t_message.data[4]);
          break;
     case 1:
          uint16_to_data(uint16_t(msg.value), &t_message.data[4]);
          break;
     case 2:
          int16_to_data(int16_t(msg.value), &t_message.data[4]);
          break;
     case 3:
          uint_to_data(uint32_t(msg.value), &t_message.data[4]);
          break;
     case 4:
          int_to_data(int32_t(msg.value), &t_message.data[4]);
          break;
     case 5:
          uint8_to_data(uint32_t(msg.value), &t_message.data[4]);
          break;
     case 6:
          int8_to_data(int32_t(msg.value), &t_message.data[4]);
          break;
     default:
          break;
     }
     ROS_INFO("can_msgs's id is : %d  ; cmd_mode is : %d", txCanIdEx->id, txCanIdEx->mode);
     can_msg_pub.publish(t_message);
}

void ResolveProperyCallback(const drempower::property_msg &msg)
{
     ROS_INFO("resolve_property_node:[%d,%d,%d,%f]", msg.id, msg.address, msg.data_type, msg.value);
     if (msg.address == 0x300f)
     {
          property_msg_pub1.publish(msg); // 这里直接转发的作用是对消息"motor_property"进行一次筛选，将消息名称改为具体的"pos_estimate"，便于后续使用（比如使用rqt_plot绘图）
     }
     else if (msg.address == 0x3010)
     {
          property_msg_pub2.publish(msg); // 这里直接转发的作用是对消息"motor_property"进行一次筛选，将消息名称改为具体的"vel_estimate"，便于后续使用（比如使用rqt_plot绘图）
     }
     else if (msg.address == 0x3011)
     {
          property_msg_pub3.publish(msg); // 这里直接转发的作用是对消息"motor_property"进行一次筛选，将消息名称改为具体的"torque_estimate"，便于后续使用（比如使用rqt_plot绘图）
     }
}

int main(int argc, char **argv)
{
     ROS_INFO("property_subscriber_node");
     ros::init(argc, argv, "property_subscriber_node");
     ros::NodeHandle n;
     ros::Subscriber read_sub = n.subscribe("read_property", 1000, ReadProperyCallback);
     ros::Subscriber write_sub = n.subscribe("write_property", 1000, WriteProperyCallback);
     ros::Subscriber resolve_sub = n.subscribe("motor_property", 1000, ResolveProperyCallback);
     can_msg_pub = n.advertise<can_msgs::Frame>("sent_messages", 10);
     property_msg_pub1 = n.advertise<drempower::property_msg>("pos_estimate", 10);
     property_msg_pub2 = n.advertise<drempower::property_msg>("vel_estimate", 10);
     property_msg_pub3 = n.advertise<drempower::property_msg>("torque_estimate", 10);
     ros::Rate rate(1);
     rate.sleep(); // 延时等待CAN通信初始化
     ros::spin();
     return 0;
}
