docker run -it --rm \
	--network host \
	-p 11311:11311 \
	--gpus all \
	--privileged \
	-e DISPLAY=unix$DISPLAY \
	--env="QT_X11_NO_MITSHM=1" \
	--volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
	--volume=$(pwd):/home/catkin_ws \
	--device=/dev/video0:/dev/video0 \
	yolo_ros:last /bin/bash -c "source devel/setup.bash && roslaunch darknet_ros yolo_ros.launch"
