# ROS 2 Humbleの公式ベースイメージを使用
FROM ros:humble

# 作業ディレクトリを設定
WORKDIR /workspace

# 必要なツールをインストール
RUN apt-get update && apt-get install -y \
    git \
    python3-colcon-common-extensions
RUN apt-get  install -y ros-humble-rqt-image-view


# ROS 2のセットアップを実行
RUN echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc

# workspaceを作成
RUN mkdir -p /workspace/src
WORKDIR /workspace/src
