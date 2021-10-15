# alpineをベースにphpアプリケーション・サーバーを構成
FROM alpine



RUN apk update && \
apk add php php-mysqlnd php-mysqli php-pgsql php-pdo php-sockets php-fpm php-apache2 php-gd php-fpm \
php7-mbstring \
php7-exif \
php7-json \
php7-session \
php7-pdo_mysql \
php7-pdo_pgsql \
php7-pdo_sqlite \
apache2

# 以下Apache2のmod_rewriteモジュール機能を有効にする
RUN apk add apache2-utils
RUN sed -i '/AllowOverride none/s/none/All/gi' /etc/apache2/httpd.conf
RUN sed -i '/AllowOverride None/s/none/All/gi' /etc/apache2/httpd.conf
RUN sed -i '/LoadModule rewrite_module/s/^#//g' /etc/apache2/httpd.conf
EXPOSE 80

WORKDIR /var/www/localhost/htdocs

CMD [ "/usr/sbin/httpd", "-DFOREGROUND" ]
