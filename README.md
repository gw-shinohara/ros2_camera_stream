# ROS2_camera_stream

## 概要
このプロジェクトでは、ROS2のカメラ関連のノードをDockerコンテナで実行できる環境を提供します。
`ros2_camera`コンテナ内の`/ros2_ws/src`ディレクトリにマウントされた`ros2_ws_src`フォルダに変更を加えることで、
別のノードを開発する際の基盤コンテナとして活用できます。

## 構成
```
ros2_camera_stream/
├── docker-compose.yml           # Docker Compose設定ファイル
├── ros2_camera/                 # ROS 2カメラ関連の設定
│   ├── Dockerfile               # ROS 2カメラコンテナのDockerfile
│   └── ros_entrypoint.sh            # コンテナ起動時に実行されるスクリプト
├── ros2_rqt/                    # RQT関連の設定
│   └── Dockerfile               # RQTコンテナのDockerfile
```

## 使用方法
1. リポジトリをクローンします。
### ros2_camera
1. `docker-compose.yml`ファイルを編集し、共有するカメラデバイスのパスを変更します。
2. `docker-compose.yml`で構成されているDockerコンテナを起動します(`docker compose run ros2_camera`)。
### ros2_rqt
1. ディスプレイの共有コマンドを実行します(`xhost +local:docker`)。
2. `docker-compose.yml`で構成されているDockerコンテナを起動します(`docker compose run ros2_rqt`)。


## 基盤コンテナとしての利用方法
1. リポジトリテンプレートに本リポジトリを選択します。
2. ディレクトリ名をros2_cameraから任意の名前に変更します。
3. `ros2_ws_src`フォルダ内のROS2パッケージを変更します。
4. docker-compose.ymlファイル内のサービス名・コンテキスト・コンテナ名・ボリュームマウント先を変更します。
5. ホストマシンと共有するデバイスを変更します。
6. Dockerfileを編集します。
7. コンテナ起動後に実行したい手順をros_entrypoint.shに書き込みます。
変更が完了したら、コンテナを再起動して、新しいパッケージや設定を即座に反映できます。

## コントリビューション
このリポジトリへの貢献は大歓迎です。
パッチや新しい機能の提案については、プルリクエストをお送りください。

## ライセンス
このプロジェクトはMITライセンスの下で提供されています。
詳細については`LICENSE`ファイルをご覧ください。

