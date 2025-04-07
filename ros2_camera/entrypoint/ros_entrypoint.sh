#!/bin/bash
source /opt/ros/humble/setup.bash
cd /ros2_ws && colcon build --symlink-install
source /ros2_ws/install/setup.bash

ros2 run v4l2_camera v4l2_camera_node
