#include "ros/ros.h"
// 自定义消息
#include "drempower/SetServoAngle.h"
#include "drempower/Target_point.h"
#include <cmath>
#include <iostream>


// using namespace fashionstar_uart_servo_ros1;

#define SERVO_ID 0                      // 舵机ID号

double_t x=45;
double_t y=0;
double_t z=74;
double_t l1=25.515;
double_t l2=27.673;
double_t h=63.6;
drempower::SetServoAngle msg;
drempower::SetServoAngle honghuoyicao;
// SetServoAngle* xy_data;
ros::Publisher input_xyz_pub;
int stop_node_flag = 1;


double_t estimate_z_value(double_t x_value , double_t y_value )
{
    double_t z_value;
    z_value = sqrt(l1*l1 - pow((sqrt(x_value*x_value + y_value*y_value) - l2*cos(M_PI/6)) , 2)) - l2 * sin(M_PI/6) + h;
    return z_value;
}

void set_servo_angle_callback(const drempower::SetServoAngle& data)
{
    msg.x=data.x;
    msg.y=data.y;
    msg.z=data.z;
    ROS_INFO("x = %.2lf ; y = %.2lf ; z = %.2lf ", msg.x, msg.y, msg.z);
    input_xyz_pub.publish(msg);
}

void Honghuoyi_xy_callback(const drempower::Target_point& data)
{
    honghuoyicao.x = data.x;
    honghuoyicao.y = data.y;
    honghuoyicao.z = estimate_z_value(honghuoyicao.x,honghuoyicao.y);
    ROS_INFO("x = %.2lf ; y = %.2lf ; z = %.2lf ", honghuoyicao.x, honghuoyicao.y, honghuoyicao.z);
    input_xyz_pub.publish(honghuoyicao);
}

int main(int argc, char **argv)
{
    // 创建节点名称
    ros::init(argc, argv, "test_input_xyz_node");
    // 创建NodeHandle
    ros::NodeHandle node_handle;
    // 创建发布者
    input_xyz_pub = node_handle.advertise<drempower::SetServoAngle>("input_xyz", 2);
    // ros::Subscriber set_xyz_sub = node_handle.subscribe("send_xy", 10, set_servo_angle_callback);
    // ros::Subscriber honghuoyi_xy_sub = node_handle.subscribe("honghuoyi_arm_xy", 10, Honghuoyi_xy_callback);
    ros::Rate loop_rate(5);

     
    float angle = 90.0;
    /********************************** */
    msg.x=x;
    msg.y=y;
    msg.z=z;
    msg.id = SERVO_ID;
    msg.angle = angle;
    /*************************************** */
    
    while(ros::ok()&&stop_node_flag<=5){
        // // 发布消息
        input_xyz_pub.publish(msg);
        stop_node_flag++;        
        // ROS_INFO("x = %.2lf ; y = %.2lf ; z = %.2lf ", msg.x, msg.y, msg.z);
        ros::spinOnce();
        loop_rate.sleep();
    }
    ROS_INFO("Shutting down arm_node.");
    ros::shutdown();
    return 0;  // 你仍然需要返回 0 或者合适的状态码
        // // 输出日志
}
