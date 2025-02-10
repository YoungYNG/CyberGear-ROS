/*
Author: Young

Code: This node(.cpp) is to publish your desire pos(angle) of the motor 
and motor will transfer to this angle 

Notice: 1.XIAOMI cybergear motor's zero_angle is when the motor get electic,
        we can't set it manually
        2.You should limit the max_current all of your cyber,you can set it 
        if you don't set it or your limitation is too high , there may have some
        safety problem. 
*/

#include "ros/ros.h"
#include "drempower/info_msg.h"
#include <iostream>

#define YOUR_MOTOR_ID 1
#define YOUR_DESIRE_VEL 32.0
#define YOUR_DESIRE_POS 10.0
drempower::info_msg motor_info_msg;

int main(int argc, char **argv)
{
    ros::init(argc, argv, "control_pos_node");
    ros::NodeHandle node_handle; 
    ros::Publisher motor_info_pub = node_handle.advertise<drempower::info_msg>("motor_info", 1000);
    while(ros::ok())
    {
        motor_info_msg.id = YOUR_MOTOR_ID; 
        motor_info_msg.cmd_mode = 18;
        motor_info_msg.Vel = YOUR_DESIRE_VEL;
        motor_info_msg.limit_cur = 20.0; //According to your need, you should have some tries to set your current_limitation
        motor_info_msg.Pos = YOUR_DESIRE_POS;
        motor_info_msg.mode = "PP";
        motor_info_pub.publish(motor_info_msg);
    }

    return -1;

}
