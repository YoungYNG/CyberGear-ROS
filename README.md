
# CyberGear-ROS
Using ROS to publish control CAN msgs to XIAOMI CyberGear motor via USB-2-CAN module. This github can provide you method to control XIAOMI Cybergear motor using ROS to publish CAN msgs directly and accordingly , don't need the MCU to control and also largely increase the stability of the control system. My hardware infomation is provided in [MY_CSDN](https://blog.csdn.net/2302_80751833/article/details/145536213?spm=1001.2014.3001.5502)

## Usage
1. Move the Download directory **CyberGear-ROS-main** to your home directory

2. Enter the directory , in your command line run
 
```
cd CyberGear-ROS-main
catkin_make
```

3. In a new console：**This step is vital, you should set CAN first**
```
#set CAN for linux
which slcand
sudo modprobe can
sudo modprobe can-raw
sudo modprobe slcan
#notice that you may modify your ACMx according to your device number
sudo slcand -o -c -s8 /dev/ttyACM0 can0
sudo ip link set up can0
sudo ip link set can0 txqueuelen 1000
```

5. Start `roscore` 

6. In a new console
```
cd CyberGear-ROS-main
# source 环境
source ./devel/setup.bash 
# start all ready node
roslaunch drempower motor_ready.launch
```
6. In another new console
```
cd CyberGear-ROS-main
# source 环境
source ./devel/setup.bash 
# set your pp_info 
rosrun drempower control_pos
```

**Notice**: You should open control_pos.cpp and modify it.
You can see the node's explanation under the workspace of drempower.
