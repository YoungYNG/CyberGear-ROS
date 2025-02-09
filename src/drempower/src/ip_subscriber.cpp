#include <ros/ros.h>
#include <sstream>
#include <drempower/ip_msg.h>
#include "drempower/property_msg.h"
#include "can_msgs/Frame.h"
#include "format_data.h"

#define P_MIN -12.5f
#define P_MAX 12.5f
#define V_MIN -30.0f
#define V_MAX 30.0f
#define KP_MIN 0.0f
#define KP_MAX 500.0f
#define KD_MIN 0.0f
#define KD_MAX 5.0f
#define T_MIN -12.0f
#define T_MAX 12.0f


#define DEG_RAD M_PI / 180
#define R_MIN_RAD_S M_PI / 30

struct exCanIdInfo{
uint32_t id:8;
uint32_t data:16;
uint32_t mode:5;
uint32_t res:3;
};

ros::Publisher can_msg_pub;
ros::Publisher write_property_pub;

can_msgs::Frame t_message;
drempower::property_msg p_message;
static bool published = false;

#define txCanIdEx (((struct exCanIdInfo*)&(t_message.id)))

void msg_callback(const drempower::ip_msg &msg)
{
    ROS_INFO("ip_msg_node:[%d,%d,%f,%f,%f,%f,%f]", msg.id, msg.cmd_mode, msg.Pos, msg.speed, msg.torque, msg.kp, msg.kd);
    
    if (!published)
    {
        p_message.id = msg.id;
        p_message.cmd_mode = 18;
        p_message.address = 0x7005; // run_mode
        p_message.data_type = 5; // 数据类型 u8
        p_message.value = 0; // mode = 0:  阻抗模式 
        write_property_pub.publish(p_message);
        published = true;
    }

    txCanIdEx->mode = msg.cmd_mode;
    txCanIdEx->id = msg.id;
    txCanIdEx->res = 0;
    t_message.dlc = 8;
    t_message.is_extended = true;
   
    txCanIdEx->data = float_to_uint(msg.torque,T_MIN,T_MAX,16);
    // txCanIdEx->data = htobe16(txCanIdEx->data); 
 
    t_message.data[0]=(float_to_uint(msg.Pos*DEG_RAD,P_MIN,P_MAX,16)>>8) & 0xFF;
    t_message.data[1]=(float_to_uint(msg.Pos*DEG_RAD,P_MIN,P_MAX,16)) & 0xFF;
    t_message.data[2]=(float_to_uint(msg.speed*R_MIN_RAD_S,V_MIN,V_MAX,16)>>8) & 0xFF;
    t_message.data[3]=(float_to_uint(msg.speed*R_MIN_RAD_S,V_MIN,V_MAX,16)) & 0xFF;
    t_message.data[4]=(float_to_uint(msg.kp,KP_MIN,KP_MAX,16)>>8) & 0xFF;
    t_message.data[5]=(float_to_uint(msg.kp,KP_MIN,KP_MAX,16)) & 0xFF;
    t_message.data[6]=(float_to_uint(msg.kd,KD_MIN,KD_MAX,16)>>8) & 0xFF;
    t_message.data[7]=(float_to_uint(msg.kd,KD_MIN,KD_MAX,16)) & 0xFF;
    
    can_msg_pub.publish(t_message);
}

int main(int argc, char **argv)
{
    ROS_INFO("ip_subscriber_node");
    ros::init(argc, argv, "ip_subscriber_node");
    ros::NodeHandle n;
    ros::Subscriber sub = n.subscribe("ip_mode", 1000, msg_callback);
    write_property_pub = n.advertise<drempower::property_msg>("write_property", 10); // 属性修改
    can_msg_pub = n.advertise<can_msgs::Frame>("sent_messages", 10);
    ros::Rate rate(1);
    rate.sleep(); // 延时等待CAN通信初始化
    ros::spin();
    return 0;
}
