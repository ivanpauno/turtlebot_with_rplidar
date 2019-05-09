#! /bin/bash
SCRIPT_PATH=$(pwd)

xhost +
docker run --privileged --rm -it \
    -e DISPLAY=${DISPLAY} \
    -v /home/${USER}/.ssh:/home/${USER}_docker/.ssh \
    -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
    -v ${SCRIPT_PATH}:/home/${USER}_docker/turtlebot_ws/ \
    --device=/dev/dri:/dev/dri \
    --device=/dev/input:/dev/input \
    --network host $@ \
    ros-turtlebot:v1
