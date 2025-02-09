#include <ros/ros.h>
#include <sstream>
#include <drempower/pp_msg.h>
#include "drempower/property_msg.h"
#include "can_msgs/Frame.h"
#include "format_data.h"


#define DEG_RAD M_PI / 180
#define R_MIN_RAD_S M_PI / 30

ros::Publisher can_msg_pub;
ros::Publisher write_property_pub;


void msg_callback(const drempower::pp_msg &msg)
{
    ROS_INFO("pp_msg_node:[%d,%d,%f,%f,%f]", msg.id, msg.cmd_mode, msg.Pos, msg.Vel, msg.limit_cur);
    drempower::property_msg p_message;
    p_message.id = msg.id;//电机在can上的id标识
    p_message.cmd_mode = msg.cmd_mode;
    p_message.address = 0x7005; // run_mode
    p_message.data_type = 5; // 数据类型 u8
    p_message.value = 1; // mode = 1:  位置模式 
    write_property_pub.publish(p_message);
    p_message.address = 0x7018; 
    p_message.data_type = 0; // 数据类型 f
    p_message.value = msg.limit_cur; // 电流限制（0-27A）
    write_property_pub.publish(p_message);
    p_message.address = 0x7017; 
    p_message.data_type = 0; // 数据类型 f
    p_message.value = msg.Vel * R_MIN_RAD_S; // 最大速度限制或前馈速度（0~300r/min）
    write_property_pub.publish(p_message);
    p_message.address = 0x7016; 
    p_message.data_type = 0; // 数据类型 f
    p_message.value = msg.Pos * DEG_RAD; // 电机转动角度(度)
    write_property_pub.publish(p_message);
}

int main(int argc, char **argv)
{
    ROS_INFO("pp_subscriber_node");
    ros::init(argc, argv, "pp_subscriber_node");
    ros::NodeHandle n;
    ros::Subscriber sub = n.subscribe("pp_mode", 1000, msg_callback);
    write_property_pub = n.advertise<drempower::property_msg>("write_property", 10); // 属性修改
    can_msg_pub = n.advertise<can_msgs::Frame>("sent_messages", 10);
    ros::Rate rate(1);
    rate.sleep(); // 延时等待CAN通信初始化
    ros::spin();
    return 0;
}
