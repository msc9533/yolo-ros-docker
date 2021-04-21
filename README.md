# yolo-ros-docker

yolo ROS node with docker container. You can run yolo node inside container connected with Host PC's ROS Master!

## Dependency

- Docker
- nvidia GPU
- ROS

## Set source and pretrained weights

`Recommend:` Make individual workspace for this package.

```bash
mkdir yolo_ros_ws
cd yolo_ros_ws
git clone https://github.com/msc9533/yolo-ros-docker.git
```

Downloads pre-trained weights and yolo-ros source code from [here](https://github.com/pgigioli/darknet_ros), and ROS [usb_cam package](https://github.com/ros-drivers/usb_cam).

```
sh set_source.sh
```

This script makes source folder and download `yolo-voc.weights`

---

Build docker image.

```
docker build -t yolo_ros:last .
```

build yolo-ros package via container.

```
sh build_yolo_ros.sh
```

## Set video device

You can easily change device (default:`/dev/video0`) to your device by changing `run_yolo_ros.sh` file. 

```bash
docker run -it --rm \
	--network host \
	-p 11311:11311 \
	--gpus all \
	--privileged \
	-e DISPLAY=unix$DISPLAY \
	--env="QT_X11_NO_MITSHM=1" \
	--volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
	--volume=$(pwd):/home/catkin_ws \
	--device=/dev/video0:/dev/video0 \ #change here!
	yolo_ros:last /bin/bash -c "source devel/setup.bash && roslaunch darknet_ros yolo_ros.launch"

```

run darknet-ros launch.

```
sh run_yolo_ros.sh
```

### Guide for customizing.

TODO.

## Reference

- https://github.com/pgigioli/darknet_ros
- https://pjreddie.com/darknet
- https://github.com/ros-drivers/usb_cam
- 