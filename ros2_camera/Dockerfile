# ROS 2 Humbleの公式ベースイメージを使用
FROM ros:humble

# 作業ディレクトリを設定
WORKDIR /workspace

# 必要なツールをインストール
RUN apt-get update && apt-get install -y \
    git \
    python3-colcon-common-extensions \
    && rm -rf /var/lib/apt/lists/*

# ROS 2のセットアップを実行
RUN echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc

# workspaceを作成
RUN mkdir -p /workspace/src
WORKDIR /workspace/src

# tier4_ros2_v4l2_cameraのDependencyをクローン
RUN git clone --branch humble https://github.com/ros-perception/image_common.git

RUN apt-get update
RUN apt-get install -y ros-humble-image-transport \
    ros-humble-camera-info-manager \
    libtheora-dev \
    libogg-dev \
    libboost-python-dev

# ROS 2の依存関係をインストール
WORKDIR /workspace
RUN . /opt/ros/humble/setup.sh && colcon build --symlink-install
COPY ./entrypoint/ros_entrypoint.sh /ros_entrypoint.sh

ENTRYPOINT [ "bash", "/ros_entrypoint.sh" ]
CMD ["ros2 launch v4l2_camera v4l2_camera.launch.py"]
