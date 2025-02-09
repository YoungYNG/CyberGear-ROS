/**************************************************
大然机器人-小米CyberGear微电机ROS控制库

适用平台：linux平台
库版本号：v1.0
测试主控版本：Ubuntu 20.04.6
测试模块：DR-USB_CAN模块
测试人员：田秋俊
测试时间：2023.09.15

备注：该库函数目前可适用于大然科技的USB转CAN模块
淘宝链接： https://item.taobao.com/item.htm?spm=a1z10.5-c-s.w4002-22325405943.12.31aac3b4jKqqpc&id=705379289168
*************************************************/

#include "ros/ros.h"
#include "drempower/pp_msg.h"
#include "drempower/ip_msg.h"
#include "drempower/fv_msg.h"
#include "drempower/ft_msg.h"
#include "drempower/me_msg.h"
#include "drempower/stop_msg.h"
#include "drempower/enable_msg.h"
#include "drempower/property_msg.h"
#include <sstream>

#define MOTOR_NUM 1
// #define MOTOR_ID 2 // 根据电机ID号进行修改
#define STOP_MODE    // 通过修改这一项测试不同模式

int main(int argc, char *argv[])
{
    setlocale(LC_ALL, "");
    ros::init(argc, argv, "motor_test02_node");
    ros::NodeHandle nh;
    int motor_id = 2;
    // nh.param("motor_id", motor_id, 1);  // 默认值为1
    ROS_INFO("Motor ID: %d", motor_id);
    std::string move_mode;
    nh.param<std::string>("move_mode", move_mode, "pp_mode");  // 默认值为"default_mode"
#ifdef PP_MODE
    ros::Publisher pub = nh.advertise<drempower::pp_msg>("pp_mode", 10); // 位置
    drempower::pp_msg t_message;
    t_message.id = motor_id;
    t_message.cmd_mode = 18;//模式18是参数写入模式
    t_message.Vel = 100;
    t_message.limit_cur = 27;
    t_message.Pos = 360;
    ros::Rate rate(1);
#endif
#ifdef IP_MODE
    ros::Publisher pub = nh.advertise<drempower::ip_msg>("ip_mode", 10); // 阻抗
    drempower::ip_msg t_message;
    t_message.id = motor_id;
    t_message.cmd_mode = 1;
    t_message.torque = 0;
    t_message.Pos = -360;
    t_message.speed = 0;
    t_message.kp = 0.5;
    t_message.kd = 0;
    ros::Rate rate(1);
#endif
#ifdef FV_MODE
    ros::Publisher pub = nh.advertise<drempower::fv_msg>("fv_mode", 10); // 速度
    drempower::fv_msg t_message;
    t_message.id = motor_id;
    t_message.cmd_mode = 18;
    t_message.Vel = -40;
    t_message.limit_cur = 27;
    ros::Rate rate(0.5);
#endif
#ifdef FT_MODE
    ros::Publisher pub = nh.advertise<drempower::ft_msg>("ft_mode", 10); // 扭矩
    drempower::ft_msg t_message;
    t_message.id = motor_id;
    t_message.cmd_mode = 18;
    t_message.torque = 3.1;
    ros::Rate rate(0.5);
#endif
#ifdef SIN_MODE
    ros::Publisher pub = nh.advertise<drempower::pp_msg>("pp_mode", 10); // 正弦测试
    drempower::pp_msg t_message;
    t_message.id = motor_id;
    t_message.cmd_mode = 18;
    t_message.Pos = 0;
    t_message.Vel = 50;
    t_message.limit_cur = 27;
    ros::Rate rate(100);
    uint32_t step = 0;
#endif
#ifdef STOP_MODE
    ros::Publisher pub = nh.advertise<drempower::stop_msg>("stop_mode", 10); 
    drempower::stop_msg t_message;
    t_message.id = motor_id;
    t_message.cmd_mode = 4;
    ros::Rate rate(0.5);
#endif
#ifdef ENABLE_MODE
    ros::Publisher pub = nh.advertise<drempower::enable_msg>("enable_mode", 10); 
    drempower::stop_msg t_message;
    t_message.id = motor_id;
    t_message.cmd_mode = 3;
    ros::Rate rate(0.5);
#endif
while (ros::ok())
    {
#ifdef PP_MODE
        pub.publish(t_message);
        t_message.Pos *= -1;                                               
#else
        pub.publish(t_message);
#endif
#ifdef SIN_MODE
        t_message.Pos = 180 * 0.5 * sinf32(step / 200.0f * 2 * M_PI - M_PI_2);
        step++;
#endif
#ifdef FV_MODE
        t_message.Vel*= -1;
#endif
#ifdef FT_MODE
        t_message.torque*= -1;
#endif
        rate.sleep();
        ros::spinOnce();
    }
    return 0;
}