#!/bin/bash
source /opt/ros/humble/setup.bash
cd /ros2_ws && colcon build --symlink-install
source /ros2_ws/install/setup.bash

exec "$@"