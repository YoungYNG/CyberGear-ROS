#include <ros/ros.h>
#include "drempower/property_msg.h"
#include <drempower/me_msg.h>
#include <sstream>
#include "can_msgs/Frame.h"
#include "format_data.h"

ros::Publisher can_msg_pub;
can_msgs::Frame t_message;

struct exCanIdInfo{
uint32_t id:8;
uint32_t data:16;
uint32_t mode:5;
uint32_t res:3;
};

#define txCanIdEx (((struct exCanIdInfo*)&(t_message.id)))

void msg_callback(const drempower::me_msg &msg)
{
    ROS_INFO("msg_node:[%d]", msg.id);
    t_message.is_extended = true;
    t_message.dlc = 8;
    uint16_t master_id = 0;
    txCanIdEx->mode = msg.cmd_mode;
    txCanIdEx->id = msg.id;
    txCanIdEx->res = 0;
    txCanIdEx->data = master_id & 0xFF;
    can_msg_pub.publish(t_message);
}

int main(int argc, char **argv)
{
    ROS_INFO("me_subscriber_node");
    ros::init(argc, argv, "me_subscriber_node");
    ros::NodeHandle n;
    ros::Subscriber sub = n.subscribe("motor_enable", 1000, msg_callback);
    can_msg_pub = n.advertise<can_msgs::Frame>("sent_messages", 10);
    ros::Rate rate(1);
    rate.sleep(); // 延时等待CAN通信初始化
    ros::spin();
    return 0;
}
