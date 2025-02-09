#include "ros/ros.h"
#include "can_msgs/Frame.h"
#include <sstream>
#include "format_data.h"
#include "drempower/state_msg.h"
#include "drempower/property_msg.h"


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


ros::Publisher state_msg_pub;
ros::Publisher property_msg_pub;
ros::Publisher can_msg_pub;
struct exCanIdInfo{
uint32_t id:8;
uint32_t data:16;
uint32_t mode:5;
uint32_t res:3;
};

#define RAD_DEG 180 / M_PI
#define RAD_S_R_MIN 30 / M_PI

can_msgs::Frame t_message;
#define rxCanIdEx (((struct exCanIdInfo*)&(msg->id)))

void chatterCallback(const can_msgs::Frame::ConstPtr &msg)
{    
     drempower::state_msg i_message;
     t_message.dlc = 8;
     t_message.is_extended =true;
     i_message.id = rxCanIdEx->id;
     i_message.cmd_mode = rxCanIdEx->mode;
     i_message.cmd_data = rxCanIdEx->data;
     rxCanIdEx->res = 0;
     // 电机实时状态返回接口
     if (i_message.cmd_mode != 0x11 && i_message.cmd_mode != 0x09) // 判断通信类型否为0x11(17)
     {    
          // 提取电机ID和模式状态
          uint8_t motor_id = (i_message.cmd_data >> 8) & 0xFF;  // Bit8~Bit15: 当前电机CAN ID
          uint8_t mode_status = (i_message.cmd_data >> 22) & 0x03; // Bit22~Bit23: 模式状态
          i_message.pos_estimate = uint_to_float((msg->data[0] << 8) + msg->data[1], P_MIN, P_MAX, 16)*RAD_DEG;
          i_message.vel_estimate = uint_to_float((msg->data[2] << 8) + msg->data[3], V_MIN, V_MAX, 16)*RAD_S_R_MIN;
          i_message.torque_estimate = uint_to_float((msg->data[4] << 8) + msg->data[5], T_MIN, T_MAX, 16);
          i_message.temp = ((msg->data[6] << 8) + msg->data[7]) * 0.10f;
          state_msg_pub.publish(i_message);
          // ROS_INFO("Motor ID: %d  Mode Status: %d", motor_id, mode_status);
          ROS_INFO("motor state received data: [%d,%f, %f, %f, %f]", i_message.id, i_message.pos_estimate, i_message.vel_estimate, i_message.torque_estimate, i_message.temp);
     }
     // 通信类型是17的时候，解析参数
     else
     {
          drempower::property_msg p_message;
          uint16_t master_id = 0;
          t_message.dlc = 8;
          t_message.is_extended =true;
          p_message.id = rxCanIdEx->id;
          p_message.cmd_mode = rxCanIdEx->mode;
          p_message.cmd_data = rxCanIdEx->data;
          rxCanIdEx->res = 0;
          rxCanIdEx->data = master_id;
          for (uint8_t j = 0; j < 8; j++)
               t_message.data[j] = msg->data[j];
          p_message.address = data_to_uint16(&t_message.data[0]);
          switch (p_message.data_type)
          {
          case 0:
               p_message.value = data_to_float(&t_message.data[4]);
               break;
          case 1:
               p_message.value = data_to_uint16(&t_message.data[4]);
               break;
          case 2:
               p_message.value = data_to_int16(&t_message.data[4]);
               break;
          case 3:
               p_message.value = data_to_uint(&t_message.data[4]);
               break;
          case 4:
               p_message.value = data_to_int(&t_message.data[4]);
               break;
          case 5:
               p_message.value = data_to_uint8(&t_message.data[4]);
               break;
          case 6:
               p_message.value = data_to_int8(&t_message.data[4]);
               break;
          default:
               break;
          }
          property_msg_pub.publish(p_message);
          ROS_INFO("motor property received data: [%d, %d, %f]", p_message.id, p_message.address, p_message.value);
     }
}

int main(int argc, char **argv)
{
     ros::init(argc, argv, "recvmsg_subscriber_node");
     ros::NodeHandle n;
     //这个received_messages一直在接收来自电机的can数据，函数里面筛选了几种情况来获取消息，比如mode17读取单个参数
     //当请求的时候有应答帧时会用到
     ros::Subscriber sub = n.subscribe("received_messages", 1000, chatterCallback);
     state_msg_pub = n.advertise<drempower::state_msg>("motor_state", 10);//motor_state 话题仅仅是用来测试的，给到rqt检测状态，其他节点没有这个话题
     property_msg_pub = n.advertise<drempower::property_msg>("motor_property", 10);//send to property_subscriber_node and just for drawing the rqt-graph
     ros::spin();
     return 0;
}
