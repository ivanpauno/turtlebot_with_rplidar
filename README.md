# Turtlebot mapping with rplidar

This package provides launch files to map with the turtlebot and rplidar.

# How to use it

## Common steps for setting the environment

User should be in docker group, if not do: `adduser $USER docker`. Then:

```bash
git clone https://github.com/ivanpauno/turtlebot_with_rplidar
cd turtlebot_with_rplidar/docker
./build.sh
./start_ws.sh
cd turtlebot_ws
catkin_make
source /opt/ros/kinetic/setup.bash
source devel/setup.bash
export ROS_MASTER_URI=http://__TURTLEBOT_COMPUTER_IP__:11311
export ROS_IP=__THIS_COMPUTER_IP__
```

## Turtlebot computer

```bash
roslaunch mapping_with_lidar rplidar_turtlebot.launch
```

## User computer

Seeing maping and teleoperating with keyboard:

```bash
roslaunch mapping_with_lidar view_navigation_key_teleop.launch
```

Seeing maping and teleoperating with xbox360 joy:

```bash
roslaunch mapping_with_lidar view_navigation_xbox_joy_teleop.launch
```
