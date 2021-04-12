# yolo-ros-docker

- 별도의 workspace를 따로 구성하는것이 좋음

```
docker build -t yolo_ros:last .
```

```
sh set_source.sh
```

```
sh build_yolo_ros.sh
```


- `/dev/video0`이 기본값 다른 디바이스 이용시 binding 만 변경.


```
sh run_yolo_ros.sh
```

- 사용하고자 하는 워크스페이스에서 msg만 포함하는 darknet_ros 패키지를 빌드


```
git clone http://irl-nas2.synology.me:30000/msc9533/darknet_ros.git
```