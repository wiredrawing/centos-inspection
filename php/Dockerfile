# alpineをベースにphpアプリケーション・サーバーを構成
FROM alpine



RUN apk update && \
apk add php php-mysqlnd php-mysqli php-pgsql php-pdo php-sockets php-fpm php-apache2 \
php7-session \
php7-pdo_mysql \
php7-pdo_pgsql \
php7-pdo_sqlite \
apache2

EXPOSE 80

WORKDIR /var/www/localhost/htdocs

CMD [ "/usr/sbin/httpd", "-DFOREGROUND" ]
