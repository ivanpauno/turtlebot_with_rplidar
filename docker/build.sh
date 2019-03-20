#! /bin/bash

docker build -t ros-turtlebot:v1 . \
    --build-arg user_name=${USER}_docker \
    --build-arg user_id=$UID
