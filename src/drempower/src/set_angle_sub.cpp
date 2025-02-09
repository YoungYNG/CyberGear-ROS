#include "ros/ros.h"
#include "drempower/SetServoAngle.h"
#include "drempower/info_msg.h"
#include <mavros_msgs/State.h>
#include <mavros_msgs/RCIn.h>
// #include "CSerialPort/SerialPort.h"
// #include "FashionStar/UServo/FashionStar_UartServoProtocol.h"
// #include "FashionStar/UServo/FashionStar_UartServo.h"
#include <cmath>
#include <iostream>

// using namespace fsuservo;
// using namespace fashionstar_uart_servo_ros1;

// 参数定义
// #define SERVO_PORT_NAME "/dev/ttyUSB0"  // Linux下端口号名称 /dev/ttyUSB{}
// #define SERVO_ID0 0                      // 舵机ID号
// #define SERVO_ID1 1
// #define SERVO_ID2 2
#define GEAR_RATIO 1.83

// // 创建协议对象
// FSUS_Protocol protocol(SERVO_PORT_NAME, FSUS_DEFAULT_BAUDRATE);
// FSUS_Protocol protocol2(SERVO_PORT_NAME, FSUS_DEFAULT_BAUDRATE);
// FSUS_Protocol protocol3(SERVO_PORT_NAME, FSUS_DEFAULT_BAUDRATE);

// // 创建一个舵机对象
// FSUS_Servo servo0(SERVO_ID0, &protocol);
// FSUS_Servo servo1(SERVO_ID1, &protocol2);
// FSUS_Servo servo2(SERVO_ID2, &protocol3);

/* 舵机角度设置回调函数 */

struct Motor_Angle{
    double_t Radiance;
    double_t Degrees;
    double_t Real_Degrees;
};
struct Param{
    double_t m;
    double_t n;
    double_t k;
};
struct Bias_Angle{
    double_t Radiance;
    double_t Degrees;
    
};

double_t x;
double_t y;
double_t z;
double_t l1=25.515;
double_t l2=27.673;
double_t h=63.6;
double_t bias1 = 49.0;
double_t bias2 = 9.0;
double_t bias0 = 52/GEAR_RATIO;

mavros_msgs::State current_state;
mavros_msgs::RCIn rc_data;
ros::Publisher motor_info_pub;
drempower::info_msg motor_info_msg;


// void state_cb(const mavros_msgs::State::ConstPtr& msg){
//     current_state = *msg;
// }

// void rc_data_sub_func(const mavros_msgs::RCIn::ConstPtr& rc_data_p)
// {
//     rc_data = * rc_data_p;
//     pwm_left_manual = (1500 + 500*rc_data.channels[0] );
//     pwm_right_manual = (1500 + 500*rc_data.channels[1] );
// }
    
void set_angle_callback(const drempower::SetServoAngle& data)
{
    Motor_Angle theta3;//theta3 is beta 
    Motor_Angle theta2;//theta2 is alfa and the degree of servo 1(middle one)
    Motor_Angle theta1;//theta1 is the bottom rotation degrees and the degree of servo0(lowest one )
    Motor_Angle theta4;//degree of servo2(up one)
    Param Param_theta2;
    Bias_Angle Bias_Angle_theta2;
    x = data.x;
    y = data.y;
    z = data.z;
    if((x>=l1+l2) || (y>=l1+l2) || (z>l1+l2+h) || z<0 || z<28)//28 is the lowest height from ground to camera
    {
        ROS_ERROR("Wrong point to get , please reset your (x,y,z) point!!!");
    }
    else
    {
        if(z>h)
            {
                theta3.Radiance = acos((z*z-2*z*h+h*h+x*x+y*y-l1*l1-l2*l2)/(-2*l1*l2));
                Param_theta2.m = l1-l2*cos(theta3.Radiance);
                Param_theta2.n = l2*sin(theta3.Radiance);
                Param_theta2.k = sqrt(x*x+y*y);
                theta2.Radiance = asin(Param_theta2.k/sqrt(Param_theta2.m*Param_theta2.m+Param_theta2.n*Param_theta2.n))-atan(Param_theta2.n/Param_theta2.m);
                // ROS_INFO("theta2.Radiance = %lf",theta2.Radiance);
                theta1.Radiance = atan2(y,x);
                theta3.Degrees = theta3.Radiance*180.0/M_PI;
                theta2.Degrees = theta2.Radiance*180.0/M_PI;
                theta1.Degrees = theta1.Radiance*180.0/M_PI;
                theta4.Degrees = 90 + theta2.Degrees - theta3.Degrees;
                // ROS_INFO("theta1 = %lf ; theta2 = %lf ; theta3 = %lf ;theta4 = %lf ", theta1.Real_Degrees , theta2.Real_Degrees , theta3.Degrees , theta4.Real_Degrees);
                // theta3.Real_Degrees = -1 * theta3.Degrees + 90 - bias2;
                if(theta4.Real_Degrees>0)
                {
                    theta4.Real_Degrees = theta4.Degrees - bias2;
                }
                else
                {
                    theta4.Real_Degrees = -1 * theta4.Degrees - bias2;
                }
                // theta4.Real_Degrees = -1 * theta4.Degrees - bias2;
                theta2.Real_Degrees = -1 * theta2.Degrees - bias1;
                theta1.Real_Degrees = (theta1.Degrees + bias0) * GEAR_RATIO;
                // ROS_INFO("theta1 = %lf ; theta2 = %lf ; theta3 = %lf ;theta4 = %lf ", theta1.Degrees , theta2.Degrees , theta3.Degrees , theta4.Degrees);
                ROS_INFO("theta1 = %lf ; theta2 = %lf ; theta3 = %lf ;theta4 = %lf ", theta1.Real_Degrees , theta2.Real_Degrees , theta3.Real_Degrees , theta4.Real_Degrees);
                if(theta2.Degrees<=120 && theta2.Degrees>=-30 && theta3.Degrees>=10 && theta3.Degrees<=170)
                { 
                    // servo0.setRawAngleMTurnByVelocity(theta1.Real_Degrees*GEAR_RATIO,40,500,500,48000);//theta1.Degrees
                    // servo1.setRawAngleByVelocity(theta2.Real_Degrees,35,300,500,0);
                    // servo2.setRawAngleByVelocity(theta4.Real_Degrees,25,800,500,0);

                    motor_info_msg.id = 2;
                    motor_info_msg.cmd_mode = 18;
                    motor_info_msg.Vel = 32.0;
                    motor_info_msg.limit_cur = 20.0;
                    motor_info_msg.Pos = theta2.Real_Degrees;
                    motor_info_msg.mode = "PP";
                    motor_info_pub.publish(motor_info_msg);
                    // ros::Duration(2.0).sleep(); // 延时0.5秒
                    motor_info_msg.id = 3;
                    motor_info_msg.cmd_mode = 18;
                    motor_info_msg.Vel = 15.0;
                    motor_info_msg.limit_cur = 4.0;
                    motor_info_msg.Pos = theta4.Real_Degrees;
                    motor_info_msg.mode = "PP";
                    motor_info_pub.publish(motor_info_msg);
                    ros::Duration(4.0).sleep(); // 延时0.5秒
                    
                    motor_info_msg.id = 1;
                    motor_info_msg.cmd_mode = 18;
                    motor_info_msg.Vel = 10.0;
                    motor_info_msg.limit_cur = 5.0;
                    // motor_info_msg.Pos = theta1.Real_Degrees;
                    motor_info_msg.Pos = 30;
                    motor_info_msg.mode = "PP";
                    motor_info_pub.publish(motor_info_msg);
                   ros::Duration(4.0).sleep(); // 延时0.5秒

                    motor_info_msg.id = 1;
                    motor_info_msg.cmd_mode = 18;
                    motor_info_msg.Vel = 10.0;
                    motor_info_msg.limit_cur = 5.0;
                    // motor_info_msg.Pos = theta1.Real_Degrees;
                    motor_info_msg.Pos = -30;
                    motor_info_msg.mode = "PP";
                    motor_info_pub.publish(motor_info_msg);
                    ros::Duration(4.0).sleep(); // 延时0.5秒

                    motor_info_msg.id = 1;
                    motor_info_msg.cmd_mode = 18;
                    motor_info_msg.Vel = 10.0;
                    motor_info_msg.limit_cur = 5.0;
                    // motor_info_msg.Pos = theta1.Real_Degrees;
                    motor_info_msg.Pos = 0;
                    motor_info_msg.mode = "PP";
                    motor_info_pub.publish(motor_info_msg);
                }
                else{
                    ROS_ERROR("Your point cannot be arrived because the degrees is limited");
                }
                
            }
            else
            {
                theta3.Radiance = acos((z*z-2*z*h+h*h+x*x+y*y-l1*l1-l2*l2)/(-2*l1*l2));
                Param_theta2.m = l1-l2*cos(theta3.Radiance);
                Param_theta2.n = l2*sin(theta3.Radiance);
                Param_theta2.k = sqrt(x*x+y*y);
                Bias_Angle_theta2.Radiance = atan((h-z)/sqrt(x*x+y*y));
                Bias_Angle_theta2.Degrees = Bias_Angle_theta2.Radiance*180.0/M_PI;
                theta2.Radiance = 2*Bias_Angle_theta2.Radiance+(asin(Param_theta2.k/sqrt(Param_theta2.m*Param_theta2.m+Param_theta2.n*Param_theta2.n))-atan(Param_theta2.n/Param_theta2.m));
                // ROS_INFO("theta2.Radiance = %lf",theta2.Radiance);
                theta1.Radiance = atan2(y,x);
                theta3.Degrees = theta3.Radiance*180.0/M_PI;
                theta2.Degrees = theta2.Radiance*180.0/M_PI;
                theta1.Degrees = theta1.Radiance*180.0/M_PI;
                theta4.Degrees = 90 + theta2.Degrees - theta3.Degrees;
                if(theta4.Real_Degrees>0)
                {
                    theta4.Real_Degrees = theta4.Degrees - bias2;
                }
                else
                {
                    theta4.Real_Degrees = -1 * theta4.Degrees - bias2;
                }
                // theta4.Real_Degrees = -1 * theta4.Degrees + 90 - bias2;
                theta2.Real_Degrees = -1 * theta2.Degrees - bias1;
                theta1.Real_Degrees = (theta1.Degrees + bias0) * GEAR_RATIO;
                // ROS_INFO("theta1 = %lf ; theta2 = %lf ; theta3 = %lf ;theta4 = %lf ", theta1.Degrees , theta2.Degrees , theta3.Degrees , theta4.Degrees);
                // ROS_INFO("theta1 = %lf ; theta2 = %lf ; theta3 = %lf ", theta1.Degrees , theta2.Degrees , theta3.Degrees);
                ROS_INFO("theta1 = %lf ; theta2 = %lf ; theta3 = %lf ;theta4 = %lf ", theta1.Real_Degrees , theta2.Real_Degrees , theta3.Degrees , theta4.Real_Degrees);
                if(theta2.Degrees<=120 && theta2.Degrees>=-30 && theta3.Degrees>=10 && theta3.Degrees<=170)
                {
                    // servo0.setRawAngleMTurnByVelocity(theta1.Real_Degrees*GEAR_RATIO,40,500,500,48000);//theta1.Degrees
                    // servo1.setRawAngleByVelocity(theta2.Real_Degrees,35,300,500,0);
                    // servo2.setRawAngleByVelocity(theta4.Real_Degrees,25,800,500,0);

                    motor_info_msg.id = 2;
                    motor_info_msg.cmd_mode = 18;
                    motor_info_msg.Vel = 32.0;
                    motor_info_msg.limit_cur = 20.0;
                    motor_info_msg.Pos = theta2.Real_Degrees;
                    motor_info_msg.mode = "PP";
                    motor_info_pub.publish(motor_info_msg);
                    // ros::Duration(2.0).sleep(); // 延时0.5秒
                    motor_info_msg.id = 3;
                    motor_info_msg.cmd_mode = 18;
                    motor_info_msg.Vel = 15.0;
                    motor_info_msg.limit_cur = 4.0;
                    motor_info_msg.Pos = theta4.Real_Degrees;
                    motor_info_msg.mode = "PP";
                    motor_info_pub.publish(motor_info_msg);
                    ros::Duration(4.0).sleep(); // 延时0.5秒
                    
                    motor_info_msg.id = 1;
                    motor_info_msg.cmd_mode = 18;
                    motor_info_msg.Vel = 10.0;
                    motor_info_msg.limit_cur = 5.0;
                    // motor_info_msg.Pos = theta1.Real_Degrees;
                    motor_info_msg.Pos = 30;
                    motor_info_msg.mode = "PP";
                    motor_info_pub.publish(motor_info_msg);
                   ros::Duration(4.0).sleep(); // 延时0.5秒

                    motor_info_msg.id = 1;
                    motor_info_msg.cmd_mode = 18;
                    motor_info_msg.Vel = 10.0;
                    motor_info_msg.limit_cur = 5.0;
                    // motor_info_msg.Pos = theta1.Real_Degrees;
                    motor_info_msg.Pos = -30;
                    motor_info_msg.mode = "PP";
                    motor_info_pub.publish(motor_info_msg);
                    ros::Duration(4.0).sleep(); // 延时0.5秒

                    motor_info_msg.id = 1;
                    motor_info_msg.cmd_mode = 18;
                    motor_info_msg.Vel = 10.0;
                    motor_info_msg.limit_cur = 5.0;
                    // motor_info_msg.Pos = theta1.Real_Degrees;
                    motor_info_msg.Pos = 0;
                    motor_info_msg.mode = "PP";
                    motor_info_pub.publish(motor_info_msg);
                }
                else{
                    ROS_ERROR("Your point cannot be arrived because the degrees is limited");
                }
            }
    }
    
}


int main(int argc, char **argv)
{
    ros::init(argc, argv, "set_angle_sub");
    ros::NodeHandle node_handle; 
    motor_info_pub = node_handle.advertise<drempower::info_msg>("motor_info", 1000);
    ros::Subscriber set_angle_sub = node_handle.subscribe("input_xyz", 1000, set_angle_callback);
   
    ros::spin();

}
