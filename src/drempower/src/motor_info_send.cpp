#include "ros/ros.h"
#include "drempower/info_msg.h"
#include <sstream>

int main(int argc, char *argv[])
{
    setlocale(LC_ALL, "");
    ros::init(argc, argv, "motor_command_publisher");
    ros::NodeHandle nh;

    ros::Publisher info_pub = nh.advertise<drempower::info_msg>("motor_info", 100);

    ros::Rate loop_rate(2);

    while (ros::ok())
    {
        drempower::info_msg info_msg;

        // 设置消息内容
        info_msg.id = 1;
        info_msg.cmd_mode = 18;
        info_msg.Vel = 5.0;
        info_msg.limit_cur = 10.0;
        info_msg.Pos = 10.0;
        info_msg.mode = "PP";
        info_pub.publish(info_msg);
        ROS_INFO("Published info_msg: id=%d, cmd_mode=%d, Vel=%f, limit_cur=%f, Pos=%f, mode=%s", info_msg.id, info_msg.cmd_mode, info_msg.Vel, info_msg.limit_cur, info_msg.Pos, info_msg.mode.c_str());
       
        ros::Duration(2).sleep(); // 延时0.5秒

        info_msg.id = 2;
        info_msg.cmd_mode = 18;
        info_msg.Vel = 5.0;
        info_msg.limit_cur = 10.0;
        info_msg.Pos = -7.0;
        info_msg.mode = "PP";
        info_pub.publish(info_msg);
        ROS_INFO("Published info_msg: id=%d, cmd_mode=%d, Vel=%f, limit_cur=%f, Pos=%f, mode=%s", info_msg.id, info_msg.cmd_mode, info_msg.Vel, info_msg.limit_cur, info_msg.Pos, info_msg.mode.c_str());

        info_msg.id = 3;
        info_msg.cmd_mode = 18;
        info_msg.Vel = 5.0;
        info_msg.limit_cur = 10.0;
        info_msg.Pos = -9.0;
        info_msg.mode = "PP";
        info_pub.publish(info_msg);
        ROS_INFO("Published info_msg: id=%d, cmd_mode=%d, Vel=%f, limit_cur=%f, Pos=%f, mode=%s", info_msg.id, info_msg.cmd_mode, info_msg.Vel, info_msg.limit_cur, info_msg.Pos, info_msg.mode.c_str());
        

        

        // info_msg.id = 3;
        // info_msg.cmd_mode = 18;
        // info_msg.Vel = 100.0;
        // info_msg.limit_cur = 10.0;
        // info_msg.Pos = 50.0;
        // info_msg.mode = "FV";
        // info_pub.publish(info_msg);
        // ROS_INFO("Published info_msg: id=%d, cmd_mode=%d, Vel=%f, limit_cur=%f, Pos=%f, mode=%s", info_msg.id, info_msg.cmd_mode, info_msg.Vel, info_msg.limit_cur, info_msg.Pos, info_msg.mode.c_str());

        // info_msg.mode = "STOP";
        // info_pub.publish(info_msg);
        // ROS_INFO("Published info_msg: id=%d, cmd_mode=%d, Vel=%f, limit_cur=%f, Pos=%f, mode=%s", info_msg.id, info_msg.cmd_mode, info_msg.Vel, info_msg.limit_cur, info_msg.Pos, info_msg.mode.c_str());

        // info_msg.mode = "ENABLE";
        // info_pub.publish(info_msg);
        // ROS_INFO("Published info_msg: id=%d, cmd_mode=%d, Vel=%f, limit_cur=%f, Pos=%f, mode=%s", info_msg.id, info_msg.cmd_mode, info_msg.Vel, info_msg.limit_cur, info_msg.Pos, info_msg.mode.c_str());

        // info_msg.id = 2;
        // info_msg.mode = "ZERO";
        // info_pub.publish(info_msg);
        // ROS_INFO("Published info_msg: id=%d, cmd_mode=%d, Vel=%f, limit_cur=%f, Pos=%f, mode=%s", info_msg.id, info_msg.cmd_mode, info_msg.Vel, info_msg.limit_cur, info_msg.Pos, info_msg.mode.c_str());

        // info_msg.id = 3;
        // info_msg.mode = "ZERO";
        // info_pub.publish(info_msg);
        // ROS_INFO("Published info_msg: id=%d, cmd_mode=%d, Vel=%f, limit_cur=%f, Pos=%f, mode=%s", info_msg.id, info_msg.cmd_mode, info_msg.Vel, info_msg.limit_cur, info_msg.Pos, info_msg.mode.c_str());


        ros::spinOnce();
        loop_rate.sleep();
    }

    return 0;
}