/*
Author: Young

Code: This node(.cpp) is to subscribe mode_info,vel_info,pos_info and so on from the publisher
      and send the msgs to related mode_node .

Notice: 1.XIAOMI cybergear motor's zero_angle is when the motor get electic,
        we can't set it manually
        2.You should limit the max_current all of your cyber,you can set it 
        if you don't set it or your limitation is too high , there may have some
        safety problem. 
*/

#include "ros/ros.h"
#include "drempower/pp_msg.h"
#include "drempower/ip_msg.h"
#include "drempower/fv_msg.h"
#include "drempower/ft_msg.h"
#include "drempower/me_msg.h"
#include "drempower/stop_msg.h"
#include "drempower/info_msg.h"
#include <drempower/zero_pos_msg.h>
#include "drempower/enable_msg.h"
#include "drempower/property_msg.h"
#include <sstream>

// 全局变量
ros::Publisher pub;
std::string current_mode;

void info_callback(const drempower::info_msg &msg)
{
    std::string mode = msg.mode;

    if (mode != current_mode) {
        if (mode == "PP")
        {
            pub = ros::NodeHandle().advertise<drempower::pp_msg>("pp_mode", 100); // 位置模式
            current_mode = "PP";
        }
        else if (mode == "IP")
        {
            pub = ros::NodeHandle().advertise<drempower::ip_msg>("ip_mode", 100); // 阻抗模式
            current_mode = "IP";
        }
        else if (mode == "FV")
        {
            pub = ros::NodeHandle().advertise<drempower::fv_msg>("fv_mode", 100); // 速度模式
            current_mode = "FV";
        }
        else if (mode == "FT")
        {
            pub = ros::NodeHandle().advertise<drempower::ft_msg>("ft_mode", 100); // 扭矩模式
            current_mode = "FT";
        }
        else if (mode == "SIN")
        {
            pub = ros::NodeHandle().advertise<drempower::pp_msg>("pp_mode", 100); // 正弦测试
            current_mode = "SIN";
        }
        else if (mode == "STOP")
        {
            pub = ros::NodeHandle().advertise<drempower::stop_msg>("stop_mode", 100); // 停止模式
            current_mode = "STOP";
        }
        else if (mode == "ENABLE")
        {
            pub = ros::NodeHandle().advertise<drempower::enable_msg>("enable_mode", 100); // 使能模式
            current_mode = "ENABLE";
        }
        else if (mode == "ZERO")
        {
            pub = ros::NodeHandle().advertise<drempower::zero_pos_msg>("zero_pos_mode", 100); // 零位模式
            current_mode = "ZERO";
        }
        else
        {
            ROS_ERROR("Unknown mode: %s", mode.c_str());
            return;
        }
    }

    if (mode == "PP")
    {
        drempower::pp_msg pp_msg;
        pp_msg.id = msg.id;
        pp_msg.cmd_mode = 18;
        pp_msg.Vel = msg.Vel;
        pp_msg.limit_cur = msg.limit_cur;
        pp_msg.Pos = msg.Pos;
        ROS_INFO("PP Mode: id=%d, cmd_mode=%d, Vel=%f, limit_cur=%f, Pos=%f", pp_msg.id, pp_msg.cmd_mode, pp_msg.Vel, pp_msg.limit_cur, pp_msg.Pos);
        pub.publish(pp_msg);
    }
    // else if (mode == "IP")         //这里面有的消息没有定义，比如torgue，去info_msg里面添加
    // {
    //     drempower::ip_msg ip_msg;
    //     ip_msg.id = msg.id;
    //     ip_msg.cmd_mode = 1;
    //     ip_msg.torque = msg.Vel; // assuming torque is represented by Vel in motor_command.msg
    //     ip_msg.Pos = msg.Pos;
    //     ip_msg.speed = 0;
    //     ip_msg.kp = 0.5;
    //     ip_msg.kd = 0;
    //     ROS_INFO("IP Mode: id=%d, cmd_mode=%d, torque=%f, Pos=%f, speed=%f, kp=%f, kd=%f", ip_msg.id, ip_msg.cmd_mode, ip_msg.torque, ip_msg.Pos, ip_msg.speed, ip_msg.kp, ip_msg.kd);
    //     pub.publish(ip_msg);
    // }
    else if (mode == "FV")
    {
        drempower::fv_msg fv_msg;
        fv_msg.id = msg.id;
        fv_msg.cmd_mode = 18;
        fv_msg.Vel = msg.Vel;
        fv_msg.limit_cur = msg.limit_cur;
        ROS_INFO("FV Mode: id=%d, cmd_mode=%d, Vel=%f, limit_cur=%f", fv_msg.id, fv_msg.cmd_mode, fv_msg.Vel, fv_msg.limit_cur);
        pub.publish(fv_msg);
    }
    // else if (mode == "FT")    //力矩模式   //这里面有的消息没有定义，比如torgue，去info_msg里面添加
    // {
    //     drempower::ft_msg ft_msg;
    //     ft_msg.id = msg.id;
    //     ft_msg.cmd_mode = 18;
    //     ft_msg.torque = msg.Vel; // assuming torque is represented by Vel in motor_command.msg
    //     ROS_INFO("FT Mode: id=%d, cmd_mode=%d, torque=%f", ft_msg.id, ft_msg.cmd_mode, ft_msg.torque);
    //     pub.publish(ft_msg);
    // }
    // else if (mode == "SIN")
    // {
    //     drempower::pp_msg pp_msg;
    //     pp_msg.id = msg.id;
    //     pp_msg.cmd_mode = 18;
    //     pp_msg.Pos = 0;
    //     pp_msg.Vel = msg.Vel;
    //     pp_msg.limit_cur = msg.limit_cur;
    //     static uint32_t step = 0;
    //     pp_msg.Pos = 180 * 0.5 * sin(step / 200.0f * 2 * M_PI - M_PI_2);
    //     step++;
    //     ROS_INFO("SIN Mode: id=%d, cmd_mode=%d, Pos=%f, Vel=%f, limit_cur=%f", pp_msg.id, pp_msg.cmd_mode, pp_msg.Pos, pp_msg.Vel, pp_msg.limit_cur);
    //     pub.publish(pp_msg);
    // }
    else if (mode == "STOP")
    {
        drempower::stop_msg stop_msg;
        stop_msg.id = msg.id;
        stop_msg.cmd_mode = 4;
        ROS_INFO("STOP Mode: id=%d, cmd_mode=%d", stop_msg.id, stop_msg.cmd_mode);
        pub.publish(stop_msg);
    }
    else if (mode == "ENABLE")
    {
        drempower::enable_msg enable_msg;
        enable_msg.id = msg.id;
        enable_msg.cmd_mode = 3;
        ROS_INFO("ENABLE Mode: id=%d, cmd_mode=%d", enable_msg.id, enable_msg.cmd_mode);
        pub.publish(enable_msg);
    }
    else if (mode == "ZERO")
    {
        drempower::zero_pos_msg zero_msg;
        zero_msg.id = msg.id;
        zero_msg.cmd_mode = 6;
        ROS_INFO("ZERO Mode: id=%d, cmd_mode=%d", zero_msg.id, zero_msg.cmd_mode);
        pub.publish(zero_msg);
    }
}

int main(int argc, char *argv[])
{
    setlocale(LC_ALL, "");
    ros::init(argc, argv, "motor_mode_publisher_node");
    ros::NodeHandle nh;
    ros::Subscriber info_sub = nh.subscribe("motor_info", 10000, info_callback);
    // int motor_id;
    ros::Rate rate(1);
    rate.sleep(); // 延时等待CAN通信初始化
    ros::spin();
    return 0;
}