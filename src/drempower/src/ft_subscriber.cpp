#include <ros/ros.h>
#include "drempower/property_msg.h"
#include <sstream>
#include <drempower/ft_msg.h>
#include "can_msgs/Frame.h"
#include "format_data.h"

#define T_MAX 12.0f
#define I_MAX 27

float TORQUE_CONSTANT = T_MAX / I_MAX;

ros::Publisher can_msg_pub;
ros::Publisher write_property_pub;

void msg_callback(const drempower::ft_msg &msg)
{
    ROS_INFO("pp_msg_node:[%d,%d,%f]", msg.id, msg.cmd_mode, msg.torque);
    drempower::property_msg p_message;
    p_message.id = msg.id;
    p_message.cmd_mode = msg.cmd_mode;
    p_message.address = 0x7005; // run_mode
    p_message.data_type = 5; // 数据类型 u8
    p_message.value = 3; // mode = 3:  扭矩模式
    write_property_pub.publish(p_message);
    p_message.address = 0x7006; 
    p_message.data_type = 0; // 数据类型 f
    p_message.value = msg.torque / TORQUE_CONSTANT; // 电机输出（0~12Nm）
    write_property_pub.publish(p_message);
}

int main(int argc, char **argv)
{
    ROS_INFO("ft_subscriber_node");
    ros::init(argc, argv, "ft_subscriber_node");
    ros::NodeHandle n;
    ros::Subscriber sub = n.subscribe("ft_mode", 1000, msg_callback);
    can_msg_pub = n.advertise<can_msgs::Frame>("sent_messages", 10);
    write_property_pub = n.advertise<drempower::property_msg>("write_property", 10); // 属性修改
    ros::Rate rate(1);
    rate.sleep(); // 延时等待CAN通信初始化
    ros::spin();
    return 0;
}
