FROM ubuntu:20.04


# postgresqlインストール時に要求されるロケールの設定を
# 無視するため下記を追加
ARG DEBIAN_FRONTEND=noninteractive

RUN apt -y update && \
apt -y install g++ make ruby ruby-dev vim nodejs npm libpq-dev

# rails webpacker:install コマンド実行時に必要になるため
RUN npm install -g yarn

# アプリケーションディレクトリ
WORKDIR /var/www/pre

# railsパッケージのインストール
RUN gem install bundler
RUN gem install rails

WORKDIR /var/www/pre/app

EXPOSE 3000
# 環境変数をデフォルトに戻す
ARG DEBIAN_FRONTEND=newt

WORKDIR /var/www/html

# railsの起動は､コンテナ内で起動
CMD ["tail", "-f"]
