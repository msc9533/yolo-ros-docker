mkdir src
cd src
git clone --recursive -b cuda8_0-dev https://github.com/pgigioli/darknet_ros.git
git clone https://github.com/ros-drivers/usb_cam.git
mkdir -p darknet_ros/weights
cd darknet_ros/weights
wget http://pjreddie.com/media/files/yolo-voc.weights