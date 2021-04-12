FROM nvidia/cuda:8.0-cudnn6-devel-ubuntu16.04

RUN apt-get update && apt-get install -y --no-install-recommends apt-utils
RUN apt-get update \
  && DEBIAN_FRONTEND=noninteractive apt-get -y install \
    wget \
    curl \
    ffmpeg \
    libsm6 \
    libxext6 \
    mesa-utils \
    libgl1-mesa-glx \
    git
RUN /bin/sh -c "echo \"deb http://packages.ros.org/ros/ubuntu xenial main\" > /etc/apt/sources.list.d/ros1-latest.list"
# RUN apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
RUN curl -sSL 'http://keyserver.ubuntu.com/pks/lookup?op=get&search=0xC1CF6E31E6BADE8868B172B4F42ED6FBAB17C654' | apt-key add -
ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8
ENV ROS_DISTRO=kinetic
RUN apt-get update \
  && DEBIAN_FRONTEND=noninteractive apt-get -y install \
    ros-kinetic-desktop \
    ros-kinetic-camera-info-manager \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /
RUN wget https://gist.githubusercontent.com/msc9533/0ff4df052811bbb1a848309a69df74fe/raw/f0b47e4cfb86a15b63c58d59531a9747bde2751c/ros_entrypoint.sh
RUN chmod a+x ros_entrypoint.sh
WORKDIR /home/catkin_ws
RUN rm -rf /var/lib/apt/lists/*
ENV LD_LIBRARY_PATH = $LD_LIBRARY_PATH:/usr/local/cuda/lib64
ENTRYPOINT ["/ros_entrypoint.sh"]
CMD ["bash"]
