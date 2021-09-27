# 1.非特権モードでdockerコンテナを起動する

```
docker container create --name pgsql \
-it \
-p 5555:5432 \
-p 2222:22 \
-p 8888:80 \
--mount type=bind,src=/c/Users/wire-drawing/pgsql,dst=/var/www/html/pgsql centos:latest //bin/bash
```


# 2.作成したコンテナの起動

```
docker container start pgsql
```

# 3.起動したコンテナに入る

```
docker container exec -it pgsql bash
```


# 4. localeのインストール
dockerコンテナの場合は､locale不足でそのままでは
postgresqlのクラスタの初期化ができないため以下のモジュールを
インストールする

(※https://teratail.com/questions/223775)

## centos8の場合
```
dnf -y install glibc-langpack-ja
```
## centos7の場合
```
yum -y install glibc-langpack-ja
```


# 5. postgresql-serverのインストール
dnf -y install postgresql-server


# 6. LANG環境変数を設定する


## 1. ユーザの変更

```
su postgres
```

## 2. postgresユーザのLANG環境変数を変更

```
LANG=ja_JP.utf8
export LANG

```

# 7. postgresユーザーでpostgresqlサーバーの初期化

```
initdb -D /var/lib/pgsql/data
```

# 8. 作業場所を変更しpostgresqlを起動

```
# change directory
cd /var/lib/psql/data

# run postgresql server.
pg_ctl -D /var/lib/pgsql/data -l logfile start
```

# 9. postgresユーザーでpostgresqlへのログインを確認

```
# 下記コマンドでpostgresqlにログインできればOK
psql

```
