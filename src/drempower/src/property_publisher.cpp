#include "ros/ros.h"
#include "drempower/property_msg.h"
#include "drempower/ip_msg.h"
#include "drempower/pp_msg.h"
#include "drempower/ft_msg.h"
#include "drempower/fv_msg.h"
#include "drempower/me_msg.h"
#include <sstream>

#define MOTOR_NUM 1
#define MOTOR_ID 127 // 根据电机ID号进行修改
#define FV_MODE    // 通过修改这一项测试不同模式

int main(int argc, char *argv[])
{
        setlocale(LC_ALL, "");
        ROS_INFO("property_publisher_node");
        ros::init(argc, argv, "property_publisher_node");
        ros::NodeHandle nh;
        ros::Publisher read_property_pub = nh.advertise<drempower::property_msg>("read_property", 10);   // 属性读取
        ros::Publisher write_property_pub = nh.advertise<drempower::property_msg>("write_property", 10); // 属性修改
        ros::Publisher motor_enable_pub = nh.advertise<drempower::me_msg>("motor_enable", 10); 
        drempower::property_msg p_message;
        drempower::me_msg i_message;
        i_message.id = MOTOR_ID;
        i_message.cmd_mode = 3;  // 电机使能
        p_message.id = MOTOR_ID;
        ros::Rate rate(100);
        ros::Rate rate_delay(1); // 延时1s等待CAN接口初始化之后再进行reply_state配置，否则可能会出现配置不成功的情况
        rate_delay.sleep();
        motor_enable_pub.publish(i_message);
        while (ros::ok())
        {
#ifdef PP_MODE
        p_message.cmd_mode = 17;
        p_message.address = 0x300f; 
        p_message.data_type = 0; // 数据类型

        read_property_pub.publish(p_message);
#endif
#ifdef FT_MODE
        p_message.cmd_mode = 17;
        p_message.address = 0x3011; 
        p_message.data_type = 0; // 数据类型

        read_property_pub.publish(p_message);
#endif
#ifdef FV_MODE
        p_message.cmd_mode = 17;
        p_message.address = 0x3010; 
        p_message.data_type = 0; // 数据类型

        read_property_pub.publish(p_message);
#endif
#ifdef SIN_MODE
        p_message.cmd_mode = 17;
        p_message.address = 0x3016; 
        p_message.data_type = 0; // 数据类型

        read_property_pub.publish(p_message);
#endif
#ifdef IP_MODE
        p_message.cmd_mode = 17;
        p_message.address = 0x2019; 
        p_message.data_type = 0; // 数据类型

        read_property_pub.publish(p_message);
#endif
                rate.sleep();
                ros::spinOnce();
        }
        return 0;
}
