cmake_minimum_required(VERSION 3.0.2)
project(drempower)

## Compile as C++11, supported in ROS Kinetic and newer
# add_compile_options(-std=c++11)

## Find catkin macros and libraries
## if COMPONENTS list like find_package(catkin REQUIRED COMPONENTS xyz)
## is used, also find other catkin packages
find_package(catkin REQUIRED COMPONENTS
  roscpp
  rospy
  std_msgs
  message_generation
)

add_message_files(
  FILES
  pp_msg.msg
  fv_msg.msg
  ft_msg.msg
  ip_msg.msg
  me_msg.msg
  state_msg.msg
  property_msg.msg
  stop_msg.msg
  enable_msg.msg
  zero_pos_msg.msg
  info_msg.msg
  SetServoAngle.msg
  Target_point.msg
)

generate_messages(
  DEPENDENCIES
  std_msgs  # Or other packages containing msgs
)

## System dependencies are found with CMake's conventions
# find_package(Boost REQUIRED COMPONENTS system)


## Uncomment this if the package has a setup.py. This macro ensures
## modules and global scripts declared therein get installed
## See http://ros.org/doc/api/catkin/html/user_guide/setup_dot_py.html
# catkin_python_setup()

################################################
## Declare ROS messages, services and actions ##
################################################

## To declare and build messages, services or actions from within this
## package, follow these steps:
## * Let MSG_DEP_SET be the set of packages whose message types you use in
##   your messages/services/actions (e.g. std_msgs, actionlib_msgs, ...).
## * In the file package.xml:
##   * add a build_depend tag for "message_generation"
##   * add a build_depend and a exec_depend tag for each package in MSG_DEP_SET
##   * If MSG_DEP_SET isn't empty the following dependency has been pulled in
##     but can be declared for certainty nonetheless:
##     * add a exec_depend tag for "message_runtime"
## * In this file (CMakeLists.txt):
##   * add "message_generation" and every package in MSG_DEP_SET to
##     find_package(catkin REQUIRED COMPONENTS ...)
##   * add "message_runtime" and every package in MSG_DEP_SET to
##     catkin_package(CATKIN_DEPENDS ...)
##   * uncomment the add_*_files sections below as needed
##     and list every .msg/.srv/.action file to be processed
##   * uncomment the generate_messages entry below
##   * add every package in MSG_DEP_SET to generate_messages(DEPENDENCIES ...)

## Generate messages in the 'msg' folder
# add_message_files(
#   FILES
#   Message1.msg
#   Message2.msg
# )

## Generate services in the 'srv' folder
# add_service_files(
#   FILES
#   Service1.srv
#   Service2.srv
# )

## Generate actions in the 'action' folder
# add_action_files(
#   FILES
#   Action1.action
#   Action2.action
# )

## Generate added messages and services with any dependencies listed here
# generate_messages(
#   DEPENDENCIES
#   std_msgs
# )

################################################
## Declare ROS dynamic reconfigure parameters ##
################################################

## To declare and build dynamic reconfigure parameters within this
## package, follow these steps:
## * In the file package.xml:
##   * add a build_depend and a exec_depend tag for "dynamic_reconfigure"
## * In this file (CMakeLists.txt):
##   * add "dynamic_reconfigure" to
##     find_package(catkin REQUIRED COMPONENTS ...)
##   * uncomment the "generate_dynamic_reconfigure_options" section below
##     and list every .cfg file to be processed

## Generate dynamic reconfigure parameters in the 'cfg' folder
# generate_dynamic_reconfigure_options(
#   cfg/DynReconf1.cfg
#   cfg/DynReconf2.cfg
# )

###################################
## catkin specific configuration ##
###################################
## The catkin_package macro generates cmake config files for your package
## Declare things to be passed to dependent projects
## INCLUDE_DIRS: uncomment this if your package contains header files
## LIBRARIES: libraries you create in this project that dependent projects also need
## CATKIN_DEPENDS: catkin_packages dependent projects also need
## DEPENDS: system dependencies of this project that dependent projects also need
catkin_package(
  INCLUDE_DIRS
    include
  CATKIN_DEPENDS
    can_msgs
    roscpp
    message_runtime
)

###########
## Build ##
###########

## Specify additional locations of header files
## Your package locations should be listed before other locations
include_directories(
  ${PROJECT_SOURCE_DIR}/devel/include/
  include
  ${catkin_INCLUDE_DIRS}
)

#声明想要的可执行文件的文件名，以及所需要的源列表，如果有多个源列表，空格列在此处
add_executable(me_subscriber_node src/me_subscriber.cpp)
#告诉Cmake当链接此可执行文件时需要链接哪些库
target_link_libraries(me_subscriber_node ${catkin_LIBRARIES})

#声明想要的可执行文件的文件名，以及所需要的源列表，如果有多个源列表，空格列在此处
add_executable(recvmsg_subscriber_node src/recvmsg_subscriber.cpp)
#告诉Cmake当链接此可执行文件时需要链接哪些库
target_link_libraries(recvmsg_subscriber_node ${catkin_LIBRARIES})

#声明想要的可执行文件的文件名，以及所需要的源列表，如果有多个源列表，空格列在此处
add_executable(property_subscriber_node src/property_subscriber.cpp)
#告诉Cmake当链接此可执行文件时需要链接哪些库
target_link_libraries(property_subscriber_node ${catkin_LIBRARIES})

add_executable(property_publisher_node src/property_publisher.cpp)
#告诉Cmake当链接此可执行文件时需要链接哪些库
target_link_libraries(property_publisher_node ${catkin_LIBRARIES})

add_executable(motor_test_node src/motor_test_publisher.cpp)
#告诉Cmake当链接此可执行文件时需要链接哪些库
target_link_libraries(motor_test_node ${catkin_LIBRARIES})

add_executable(motor_test02_node src/motor_test02_publisher.cpp)
#告诉Cmake当链接此可执行文件时需要链接哪些库
target_link_libraries(motor_test02_node ${catkin_LIBRARIES})

add_executable(motor_test03_node src/motor_test03_publisher.cpp)
#告诉Cmake当链接此可执行文件时需要链接哪些库
target_link_libraries(motor_test03_node ${catkin_LIBRARIES})

add_executable(motor_info_send src/motor_info_send.cpp)
#告诉Cmake当链接此可执行文件时需要链接哪些库
target_link_libraries(motor_info_send ${catkin_LIBRARIES})

add_executable(pp_subscriber_node src/pp_subscriber.cpp)
#告诉Cmake当链接此可执行文件时需要链接哪些库
target_link_libraries(pp_subscriber_node ${catkin_LIBRARIES})

add_executable(ip_subscriber_node src/ip_subscriber.cpp)
#告诉Cmake当链接此可执行文件时需要链接哪些库
target_link_libraries(ip_subscriber_node ${catkin_LIBRARIES})

add_executable(fv_subscriber_node src/fv_subscriber.cpp)
#告诉Cmake当链接此可执行文件时需要链接哪些库
target_link_libraries(fv_subscriber_node ${catkin_LIBRARIES})

add_executable(ft_subscriber_node src/ft_subscriber.cpp)
#告诉Cmake当链接此可执行文件时需要链接哪些库
target_link_libraries(ft_subscriber_node ${catkin_LIBRARIES})

add_executable(stop_node src/stop_node.cpp)
#告诉Cmake当链接此可执行文件时需要链接哪些库
target_link_libraries(stop_node ${catkin_LIBRARIES})

add_executable(enable_node src/enable_node.cpp)
#告诉Cmake当链接此可执行文件时需要链接哪些库
target_link_libraries(enable_node ${catkin_LIBRARIES})

add_executable(zero_pos_node src/zero_pos_node.cpp)
#告诉Cmake当链接此可执行文件时需要链接哪些库
target_link_libraries(zero_pos_node ${catkin_LIBRARIES})

add_executable(zero_all_node src/zero_all_node.cpp)
#告诉Cmake当链接此可执行文件时需要链接哪些库
target_link_libraries(zero_all_node ${catkin_LIBRARIES})

#声明想要的可执行文件的文件名，以及所需要的源列表，如果有多个源列表，空格列在此处
add_executable(send_xy src/send_xy.cpp)
#告诉Cmake当链接此可执行文件时需要链接哪些库
target_link_libraries(send_xy ${catkin_LIBRARIES})

#声明想要的可执行文件的文件名，以及所需要的源列表，如果有多个源列表，空格列在此处
add_executable(input_xyz src/input_xyz.cpp)
#告诉Cmake当链接此可执行文件时需要链接哪些库
target_link_libraries(input_xyz ${catkin_LIBRARIES})

#声明想要的可执行文件的文件名，以及所需要的源列表，如果有多个源列表，空格列在此处
add_executable(set_angle_sub src/set_angle_sub.cpp)
#告诉Cmake当链接此可执行文件时需要链接哪些库
target_link_libraries(set_angle_sub ${catkin_LIBRARIES})

#声明想要的可执行文件的文件名，以及所需要的源列表，如果有多个源列表，空格列在此处
add_executable(enable_all_node src/enable_all_node.cpp)
#告诉Cmake当链接此可执行文件时需要链接哪些库
target_link_libraries(enable_all_node ${catkin_LIBRARIES})

#声明想要的可执行文件的文件名，以及所需要的源列表，如果有多个源列表，空格列在此处
add_executable(stop_all_node src/stop_all_node.cpp)
#告诉Cmake当链接此可执行文件时需要链接哪些库
target_link_libraries(stop_all_node ${catkin_LIBRARIES})

#声明想要的可执行文件的文件名，以及所需要的源列表，如果有多个源列表，空格列在此处
add_executable(test_input_xyz src/test_input_xyz.cpp)
#告诉Cmake当链接此可执行文件时需要链接哪些库
target_link_libraries(test_input_xyz ${catkin_LIBRARIES})


## Declare a C++ library
# add_library(${PROJECT_NAME}
#   src/${PROJECT_NAME}/drempower.cpp
# )

## Add cmake target dependencies of the library
## as an example, code may need to be generated before libraries
## either from message generation or dynamic reconfigure
# add_dependencies(${PROJECT_NAME} ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})
add_dependencies(set_angle_sub ${PROJECT_NAME}_generate_messages_cpp)
add_dependencies(input_xyz ${PROJECT_NAME}_generate_messages_cpp)
add_dependencies(send_xy ${PROJECT_NAME}_generate_messages_cpp)

## Declare a C++ executable
## With catkin_make all packages are built within a single CMake context
## The recommended prefix ensures that target names across packages don't collide
# add_executable(${PROJECT_NAME}_node src/drempower_node.cpp)

## Rename C++ executable without prefix
## The above recommended prefix causes long target names, the following renames the
## target back to the shorter version for ease of user use
## e.g. "rosrun someones_pkg node" instead of "rosrun someones_pkg someones_pkg_node"
# set_target_properties(${PROJECT_NAME}_node PROPERTIES OUTPUT_NAME node PREFIX "")

## Add cmake target dependencies of the executable
## same as for the library above
# add_dependencies(${PROJECT_NAME}_node ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})

## Specify libraries to link a library or executable target against
# target_link_libraries(${PROJECT_NAME}_node
#   ${catkin_LIBRARIES}
# )

#############
## Install ##
#############

# all install targets should use catkin DESTINATION variables
# See http://ros.org/doc/api/catkin/html/adv_user_guide/variables.html

## Mark executable scripts (Python etc.) for installation
## in contrast to setup.py, you can choose the destination
# catkin_install_python(PROGRAMS
#   scripts/my_python_script
#   DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
# )

## Mark executables for installation
## See http://docs.ros.org/melodic/api/catkin/html/howto/format1/building_executables.html
# install(TARGETS ${PROJECT_NAME}_node
#   RUNTIME DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
# )

## Mark libraries for installation
## See http://docs.ros.org/melodic/api/catkin/html/howto/format1/building_libraries.html
# install(TARGETS ${PROJECT_NAME}
#   ARCHIVE DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
#   LIBRARY DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
#   RUNTIME DESTINATION ${CATKIN_GLOBAL_BIN_DESTINATION}
# )

## Mark cpp header files for installation
# install(DIRECTORY include/${PROJECT_NAME}/
#   DESTINATION ${CATKIN_PACKAGE_INCLUDE_DESTINATION}
#   FILES_MATCHING PATTERN "*.h"
#   PATTERN ".svn" EXCLUDE
# )

## Mark other files for installation (e.g. launch and bag files, etc.)
# install(FILES
#   # myfile1
#   # myfile2
#   DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}
# )

#############
## Testing ##
#############

## Add gtest based cpp test target and link libraries
# catkin_add_gtest(${PROJECT_NAME}-test test/test_drempower.cpp)
# if(TARGET ${PROJECT_NAME}-test)
#   target_link_libraries(${PROJECT_NAME}-test ${PROJECT_NAME})
# endif()

## Add folders to be run by python nosetests
# catkin_add_nosetests(test)


