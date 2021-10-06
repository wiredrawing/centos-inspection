FROM ubuntu:20.04

# ソフトウェアインストール時のインタラクティブをOFFに
ENV DEBIAN_FRONTEND=noninteractive

# nodejsのインストール
RUN apt -y update && \
apt -y install nodejs \
curl \
npm

# node.jsのふくすうバージョン管理ツール

RUN npm install n

# DEBIAN_FRONTENDをデフォルト値に戻す
ENV DEBIAN_FRONTEND=newt


EXPOSE 3000
EXPOSE 3001
EXPOSE 3002

# アプリケーションパス
WORKDIR /var/www/html/app

# フォアグラウンド実行のコマンドを以下で代用する
ENTRYPOINT [ "tail", "-f", "/dev/null" ]
