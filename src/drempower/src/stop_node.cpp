/*
Author: Young

Code: This node(.cpp) is to stop certain cyber , when you use this node , 
      your motor will stop work and you can feel that the motor won't shake anymore

Notice: 1.XIAOMI cybergear motor's zero_angle is when the motor get electic,
        we can't set it manually
        2.You should limit the max_current all of your cyber,you can set it 
        if you don't set it or your limitation is too high , there may have some
        safety problem. 
*/

#include <ros/ros.h>
#include <drempower/fv_msg.h>
#include <drempower/stop_msg.h>
#include "drempower/property_msg.h"
#include <sstream>
#include "can_msgs/Frame.h"
#include "format_data.h"

ros::Publisher can_msg_pub;
ros::Publisher write_property_pub;

void msg_callback(const drempower::stop_msg &msg)
{
    ROS_INFO("stop_node:[%d,%d]", msg.id, msg.cmd_mode);
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
    ROS_INFO("stop_node");
    ros::init(argc, argv, "stop_node");
    ros::NodeHandle n;
    ros::Subscriber sub = n.subscribe("stop_mode", 1000, msg_callback);
    can_msg_pub = n.advertise<can_msgs::Frame>("sent_messages", 10);
    write_property_pub = n.advertise<drempower::property_msg>("write_property", 10); // 属性修改
    ros::Rate rate(1);
    rate.sleep(); // 延时等待CAN通信初始化
    ros::spin();
    return 0;
}
