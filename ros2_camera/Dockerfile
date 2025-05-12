# CUDA対応のベースイメージを使用
FROM rwthika/ros2-torch:humble-desktop-torch2.0.1-v23.08
# FROM dustynv/ros:humble-pytorch-l4t-r35.2.1

# 作業ディレクトリを設定
WORKDIR /workspace

# 必要なツールをインストール
RUN apt-get update && apt-get install -y \
    git \
    python3 \
    python3-pip \
    python3-colcon-common-extensions \
    && rm -rf /var/lib/apt/lists/*

# ROS 2のセットアップを実行
RUN echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc

# workspaceを作成
WORKDIR /workspace/src

# tier4_ros2_v4l2_cameraのDependencyをクローン
RUN git clone --branch humble https://github.com/ros-perception/image_common.git
RUN git clone --branch humble https://github.com/ros-perception/vision_opencv.git 

RUN apt-get update
RUN apt-get install -y --no-install-recommends \
    ros-humble-image-transport \
    ros-humble-camera-info-manager \
    ros-humble-cv-bridge \
    libtheora-dev \
    libogg-dev \
    libboost-python-dev \
    libopencv-dev

# ROS 2の依存関係をインストール
WORKDIR /workspace
RUN . /opt/ros/humble/setup.sh && colcon build --symlink-install
COPY ./entrypoint/ros_entrypoint.sh /ros_entrypoint.sh
# COPY ./requirements.txt /requirements.txt
# RUN python3 -m pip install -r /requirements.txt

RUN pip install --no-cache-dir numpy==1.26.4
RUN pip install --no-cache-dir opencv-python PyYAML 
RUN pip install --no-cache-dir faster-coco-eval==1.3.0 
# RUN pip install --no-cache-dir torch torchvision --index-url https://download.pytorch.org/whl/cu126
RUN pip install --no-cache-dir tensorrt
RUN pip install --no-cache-dir pycuda

ENTRYPOINT [ "bash", "/ros_entrypoint.sh" ]
CMD ["bash"]
