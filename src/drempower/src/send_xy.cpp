#include "ros/ros.h"
#include <mavros_msgs/State.h>
#include <mavros_msgs/RCIn.h>
#include <cmath>
#include <iostream>
// 自定义消息
#include "drempower/SetServoAngle.h"

#define ARM_X_CHANNEL 1
#define ARM_Y_CHANNEL 0
#define NOISE 80
#define INCREASING_RATE 0.2

// using namespace fashionstar_uart_servo_ros1;

drempower::SetServoAngle msg;
ros::Time last_time;
mavros_msgs::State current_state;
mavros_msgs::RCIn rc_data;
double arm_x_increase = 0;
double arm_y_increase = 0;
double_t l1=25.515;
double_t l2=27.673;
double_t h=63.6;
double x_increase_once = 0.0;
double y_increase_once = 0.0;
double x_decrease_once = 0.0;
double x_trans = 30.0;
double x_trans2 = 30.0;
double y_move = 0.0;


#define SERVO_ID 0                      // 舵机ID号

double_t estimate_z_value(double_t x_value , double_t y_value )
{
    double_t z_value;
    z_value = sqrt(l1*l1 - pow((sqrt(x_value*x_value + y_value*y_value) - l2*cos(M_PI/6)) , 2)) - l2 * sin(M_PI/6) + h;
    return z_value;
}


void state_cb(const mavros_msgs::State::ConstPtr& msg){
    current_state = *msg;
}

void rc_data_sub_func(const mavros_msgs::RCIn::ConstPtr& rc_data_p)
{
    
    rc_data = *rc_data_p;
    ros::Time current_time = ros::Time::now();
    double dt = (current_time - last_time).toSec();
    last_time = current_time;
    if(rc_data.channels[ARM_X_CHANNEL] > (1500 - NOISE) && rc_data.channels[ARM_X_CHANNEL] < (1500 + NOISE))
    {
        arm_x_increase += 0;
    }
    else
    {
        x_increase_once = ((rc_data.channels[ARM_X_CHANNEL] - 1500) / 500.0) * (dt/INCREASING_RATE);
        arm_x_increase += x_increase_once;
        msg.x = x_trans + arm_x_increase;
        y_move = (x_increase_once * msg.y) / msg.x ;
        arm_y_increase += y_move ;
        x_trans2 = msg.x;
        if(msg.x>45 || msg.x<-45)
        {
            msg.x = msg.x - 1.2 * x_increase_once;
        }

    }
    if(rc_data.channels[ARM_Y_CHANNEL] > (1500 - NOISE) && rc_data.channels[ARM_Y_CHANNEL] < (1500 + NOISE)) 
    {
        arm_y_increase += 0;
    }
    else
    {
        if(msg.y>45 || msg.y<-45)
        {
            msg.y = msg.y - 1.2 * y_increase_once;
        }
        y_increase_once = ((1500 - rc_data.channels[ARM_Y_CHANNEL]) / 500.0) * (dt/INCREASING_RATE);
        arm_y_increase += y_increase_once;
        msg.x = sqrt((x_trans2 * x_trans2)+(msg.y * msg.y) - (msg.y + arm_y_increase) * (msg.y + arm_y_increase)) ;
        x_trans = msg.x;
        msg.y = 0 + arm_y_increase;

        // if(msg.y>=41 || msg.y<=-41)
        // {
        //     msg.x = -msg.x;
        // }
        

        // x_decrease_once = (msg.x - sqrt((msg.x * msg.x)+(msg.y * msg.y) - (msg.y + arm_y_increase) * (msg.y + arm_y_increase))) * (dt/INCREASING_RATE);
        // arm_x_increase -= x_decrease_once;
    }
    ROS_INFO("arm_xxxx_increase### = %lf", arm_x_increase);
    ROS_INFO("arm_yyyy_increase### = %lf", arm_y_increase);
}

int stop_node_flag = 0;

int main(int argc, char **argv)
{
    // 创建节点名称
    ros::init(argc, argv, "send_xy_node");
    // 创建NodeHandle
    ros::NodeHandle node_handle;
    // 创建发布者
    ros::Publisher send_xy_pub = node_handle.advertise<drempower::SetServoAngle>("send_xy", 10);
    ros::Subscriber state_sub = node_handle.subscribe<mavros_msgs::State>
            ("mavros/state", 10 , state_cb);
    ros::Subscriber rc_data_sub = node_handle.subscribe<mavros_msgs::RCIn>
            ("mavros/rc/in", 10 , rc_data_sub_func);
    ros::Rate loop_rate(2.0);
    // 创建Message
    // SetServoAngle msg;
    // SetServoAngle msg_pre;

    msg.x=30;
    msg.y=20;

    
    while(ros::ok()){
        // 发布消息
        
        // if((msg.x>=l1+l2) || (msg.y>=l1+l2) || (msg.z>l1+l2+h) || msg.z<0 || msg.z<(h-l2))
        // {
        //     msg.x = msg.x - x_increase_once;
        //     msg.y = msg.y - y_increase_once;
        //     msg.z = estimate_z_value(msg.x,msg.y);
        //     arm_x_increase -= x_increase_once*2.0;
        //     arm_y_increase -= y_increase_once*2.0;
        // }
        // else
        // {
            msg.x = 30 + arm_x_increase;
            msg.y = 0 + arm_y_increase;
            msg.z = estimate_z_value(msg.x,msg.y);
        // }
        
        send_xy_pub.publish(msg);
        // 输出日志
        ROS_INFO("x = %.2lf ; y = %.2lf ", msg.x, msg.y );
        // stop_node_flag++;
        // ROS_INFO("Set Servo %.2lf Angle = %.1f", msg.id, msg.angle);
        // 延时等待
        ros::spinOnce();
        loop_rate.sleep();

    }
    ROS_INFO("Shutting down send_xyz_node.");
    ros::shutdown();
    return 0;  // 你仍然需要返回 0 或者合适的状态码
}
