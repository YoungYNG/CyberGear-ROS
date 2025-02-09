#include <ros/ros.h>
#include <drempower/fv_msg.h>
#include "drempower/property_msg.h"
#include <sstream>
#include "can_msgs/Frame.h"
#include "format_data.h"

#define R_MIN_RAD_S M_PI / 30

ros::Publisher can_msg_pub;
ros::Publisher write_property_pub;

void msg_callback(const drempower::fv_msg &msg)
{
    ROS_INFO("fv_msg_node:[%d,%d,%f,%f]", msg.id, msg.cmd_mode, msg.Vel, msg.limit_cur);
    drempower::property_msg p_message;
    p_message.id = msg.id;
    p_message.cmd_mode = 18;
    p_message.address = 0x7005; // run_mode
    p_message.data_type = 5; // 数据类型 u8
    p_message.value = 2; // mode = 2:  速度模式 
    write_property_pub.publish(p_message);

    // p_message.id = msg.id;
    // p_message.cmd_mode = 3;
    // p_message.address = 0x0000; 
    // p_message.data_type = 5; // 数据类型 u8
    // p_message.value = 0x0000; 
    // write_property_pub.publish(p_message);

    p_message.address = 0x7018; 
    p_message.data_type = 0; // 数据类型 f
    p_message.value = msg.limit_cur; // 电流限制（0-27A）
    write_property_pub.publish(p_message);
    p_message.address = 0x700A; 
    p_message.data_type = 0; // 数据类型 f
    p_message.value = msg.Vel * R_MIN_RAD_S; // 最大速度限制或前馈速度（0~300r/min）
    write_property_pub.publish(p_message);
}

int main(int argc, char **argv)
{
    ROS_INFO("fv_subscriber_node");
    ros::init(argc, argv, "fv_subscriber_node");
    ros::NodeHandle n;
    ros::Subscriber sub = n.subscribe("fv_mode", 1000, msg_callback);
    can_msg_pub = n.advertise<can_msgs::Frame>("sent_messages", 100);
    write_property_pub = n.advertise<drempower::property_msg>("write_property", 10); // 属性修改
    ros::Rate rate(4);
    rate.sleep(); // 延时等待CAN通信初始化
    ros::spin();
    return 0;
}
