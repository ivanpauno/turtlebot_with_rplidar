# Turtlebot mapping with rplidar

This package provides launch files to map with the turtlebot and rplidar.

# How to use it

## Common steps for setting the environment in the robot or remote computer

### Cloning repos and building docker image

User should be in `docker` group for running `build.sh`, if not do: `sudo ./build.sh`. Then:

```bash
mkdir -p turtlebot_with_rplidar_ws/src
cd turtlebot_with_rplidar_ws/src
git clone https://github.com/ivanpauno/turtlebot_with_rplidar
git clone https://github.com/Slamtec/rplidar_ros
cd turtlebot_with_rplidar/docker
./build.sh
cd ..
```

### Running the docker image and setting up environment

In `turtlebot_with_rplidar_ws/src/turtlebot_with_rplidar` folder:

```bash
./start_ws.sh
cd turtlebot_ws
catkin_make
source /opt/ros/kinetic/setup.bash
source devel/setup.bash
export ROS_MASTER_URI=http://__TURTLEBOT_COMPUTER_IP__:11311
export ROS_IP=__THIS_COMPUTER_IP__
```

## Turtlebot computer

### SLAM

Start mapping:

```bash
roslaunch turtlebot_with_lidar gmapping_demo.launch ttyUSB_kobuki:=/dev/__TTY_USB_KOBUKI__ ttyUSB_rplidar:=/dev/__TTY_USB_RPLIDAR__
```

For saving the map, in another terminal do:

```bash
rosrun map_server map_saver -f MAP_NAME
```

The map can also be saved in the remote computer.

### Navigating in a known map

```bash
roslaunch turtlebot_with_lidar amcl_demo.launch map_file:=PATH/TO/MAP/YALM/FILE ttyUSB_kobuki:=/dev/__TTY_USB_KOBUKI__ ttyUSB_rplidar:=/dev/__TTY_USB_RPLIDAR__
```

## User computer

View navigation and teleoperating with keyboard:

```bash
roslaunch turtlebot_with_lidar view_navigation_key_teleop.launch
```

View navigation and teleoperating with xbox360 joy:

```bash
roslaunch turtlebot_with_lidar view_navigation_xbox_joy_teleop.launch
```
