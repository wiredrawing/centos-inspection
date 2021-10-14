# 1
**docker build -t alpine-php --no-cache ./**


# 2
**docker container create --name {Branch name which you wand to nam } -it -p 8888:80 -v /home/any/some/:/var/www/localhost/htdocs alpine-php**
