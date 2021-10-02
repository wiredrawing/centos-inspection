FROM ubuntu:20.04


# postgresqlインストール時に要求されるロケールの設定を
# 無視するため下記を追加
ARG DEBIAN_FRONTEND=noninteractive

RUN apt -y update && \
apt -y install g++ make ruby ruby-dev vim nodejs npm libpq-dev

# rails webpacker:install コマンド実行時に必要になるため
RUN npm install -g yarn

# アプリケーションディレクトリ
WORKDIR /var/www/html

# railsパッケージのインストール
RUN gem install bundler
RUN gem install rails
RUN rails new app -d postgresql

WORKDIR /var/www/html/app
RUN rails webpacker:install

EXPOSE 3000
RUN echo pwd
# 環境変数をデフォルトに戻す
ARG DEBIAN_FRONTEND=newt

# デフォルトではフォアグラウンドで実行される
#CMD ["tail", "-f"]
CMD [ "rails", "s", "--binding=0.0.0.0"]
