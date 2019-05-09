FROM ros:kinetic-robot-xenial

ARG user_name=docker
ARG user_id=1000

# Setup environment
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y locales
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8

# Intel graphics packages
RUN apt-get update && apt-get -y install \
    libgl1-mesa-glx libgl1-mesa-dri && \
    rm -rf /var/lib/apt/lists/*

# Install basic packages
RUN apt-get update && apt-get install -y \
    curl \
    sudo \
    tmux \
    openssh-server \
    software-properties-common \
    bash-completion \
    debian-keyring \
    debian-archive-keyring \
    sed

# Create a user with passwordless sudo
RUN adduser --gecos "Development User" --disabled-password ${user_name} -uid ${user_id}
RUN adduser $user_name sudo
RUN adduser $user_name dialout
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
RUN echo "export QT_X11_NO_MITSHM=1" >> /home/${user_name}/.bashrc

WORKDIR /home/${user_name}

# ros-kinetic-realsense-camera package install is broken: https://github.com/intel-ros/realsense/issues/388
# It's specified as a dependency of turtlebot_bringup, and it installation also fails
# inside a docker container https://github.com/IntelRealSense/librealsense/issues/254
# (outside only realsense package fails).
# Edit the .deb of turtlebot_bringup to remove the dependency an install it.
# It's a run depend, so it isn't really needed.
RUN apt-get download ros-kinetic-turtlebot-bringup
RUN dpkg-deb -x ros-kinetic-turtlebot-bringup* tmp_folder
RUN dpkg-deb --control ros-kinetic-turtlebot-bringup* tmp_folder/DEBIAN
RUN sed -i -e 's/, ros-kinetic-realsense-camera,/,/g' tmp_folder/DEBIAN/control
RUN dpkg -b tmp_folder ros-kintetic-turtlebot-bringup.deb
RUN apt-get install -y ./ros-kintetic-turtlebot-bringup.deb
RUN rm -r tmp_folder ros-kintetic-turtlebot-bringup.deb

# Install the others needed packages
RUN apt-get install -y ros-kinetic-turtlebot-teleop \
    ros-kinetic-turtlebot-rviz-launchers \
    ros-kinetic-turtlebot-navigation

USER ${user_name}

# Clone rp_lidar src
RUN mkdir turtlebot_ws
# WORKDIR /home/${user_name}/turtlebot_ws/src
# RUN git clone https://github.com/Slamtec/rplidar_ros

WORKDIR /home/${user_name}
CMD ["bash"]
