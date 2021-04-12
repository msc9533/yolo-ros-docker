docker run -it --rm \
	--gpus all \
	--env="DISPLAY" \
	--volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
	--volume=$(pwd):/home/catkin_ws \
	--device=/dev/video0:/dev/video0 \
	yolo_ros:last catkin_make
