/*
Author: Young

Code: This node(.cpp) is to enable certain motor whose motor id 
is subcribed in the following subscribe callback
*/

#include <ros/ros.h>
#include <drempower/fv_msg.h>
#include <drempower/stop_msg.h>
#include <drempower/enable_msg.h>
#include "drempower/property_msg.h"
#include <sstream>
#include "can_msgs/Frame.h"
#include "format_data.h"

ros::Publisher can_msg_pub;
ros::Publisher write_property_pub;

void msg_callback(const drempower::enable_msg &msg)
{
    ROS_INFO("enable_node:[%d,%d]", msg.id, msg.cmd_mode);
    drempower::property_msg p_message;
    

    p_message.id = msg.id;
    p_message.cmd_mode = msg.cmd_mode;
    p_message.address = 0x0000; 
    p_message.data_type = 5; // 数据类型 u8
    p_message.value = 0x0000; 
    write_property_pub.publish(p_message);

}

int main(int argc, char **argv)
{
    ROS_INFO("enable_node");
    ros::init(argc, argv, "enable_node");
    ros::NodeHandle n;
    ros::Subscriber sub = n.subscribe("enable_mode", 1000, msg_callback);
    can_msg_pub = n.advertise<can_msgs::Frame>("sent_messages", 10);
    write_property_pub = n.advertise<drempower::property_msg>("write_property", 10); // 属性修改
    ros::Rate rate(1);
    rate.sleep(); // 延时等待CAN通信初始化
    ros::spin();
    return 0;
}
