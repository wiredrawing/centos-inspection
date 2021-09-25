# 1. dockerコンテナの起動

```
docker container run -itd  \
-p 5555:5432 -p 8888:80 -p 2222:22 \
--privileged \
--mount type=bind,src=/c/Users/wire-drawing/pgsql/,dst=/var/www/html/pgsql  \
--name pgsql centos \
/sbin/init

```


# 2. dockerコンテナ内に入る

```
docker container exec -it pgsql bash
```

# 3. localeのインストール
dockerコンテナの場合は､locale不足でそのままでは
postgresqlのクラスタの初期化ができないため以下のモジュールを
インストールする

(※https://teratail.com/questions/223775)

```
# centos8 ->
dnf -y install glibc-langpack-ja

#centos7 ->
yum -y install glibc-langpack-ja
```


# 4. localeの設定
(※https://rin-ka.net/centos-locale/)

```
localectl set-locale LANG=ja_JP.utf8
```

# 5. postgresql-serverのインストール
dnf -y install postgresql-server

# 6. postgresql-contribのインストール
dnf -y install postgresql-contrib

# 7. postgresqlサーバークラスターの初期化
postgresql-setup --initdb
※以下のような文面が表示されればOK

```
* Initializing database in '/var/lib/pgsql/data'
* Initialized, logs are in /var/lib/pgsql/initdb_postgresql.log
```


# 8. postgresqlサーバーの起動
systemctl start postgresql

# 9. 開発に必要な独自のpostgresqlアカウントを作成する

```
######################################
#1
######################################
su postgres
# bash-4.4$ とシェルが切れ変わればOK

######################################
#2
######################################
psql
# 以下のようなシェルが表示されればOK
# bash-4.4$ psql
# psql (13.3)
# Type "help" for help.
#
# postgres=#

######################################
#3
######################################
# 必要なadminユーザーを作成
create role admin with superuser login password 'admin';

# 上記adminユーザー作成後､postgresユーザーからログアウト

```

# 10. postgresqlサーバーを外部からアクセス可能にする

```
vi /var/lib/pgsql/data/postgresql.conf
```

```
#------------------------------------------------------------------------------
# CONNECTIONS AND AUTHENTICATION
#------------------------------------------------------------------------------

# - Connection Settings -

#listen_addresses = 'localhost'         # what IP address(es) to listen on;
                                        # comma-separated list of addresses;
                                        # defaults to 'localhost'; use '*' for all
                                        # (change requires restart)
# listen_addressesを修正
# 全IPアドレスを許可
listen_addresses = '*'


#port = 5432                            # (change requires restart)
# port 5432での稼働を許可する
port = 5432

```

# 11. 特定のユーザーが外部からアクセスできるようにする

```
vi /var/lib/pgsql/data/pg_hba.conf

```

```

# TYPE  DATABASE        USER            ADDRESS                 METHOD
##################################################################
# 以下を追記する
##################################################################
local   all             all                                     md5

##################################################################
# 以下を追記する
##################################################################
host     all             all             all                    md5


```


# 9. 以下の独自関数を実行する

```sql
--
-- Name: decrypt(bytea, bytea, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION decrypt(bytea, bytea, text) RETURNS bytea
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/pgcrypto', 'pg_decrypt';


ALTER FUNCTION public.decrypt(bytea, bytea, text) OWNER TO postgres;

--
-- Name: decrypt_iv(bytea, bytea, bytea, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION decrypt_iv(bytea, bytea, bytea, text) RETURNS bytea
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/pgcrypto', 'pg_decrypt_iv';


ALTER FUNCTION public.decrypt_iv(bytea, bytea, bytea, text) OWNER TO postgres;


--
-- Name: encrypt(bytea, bytea, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION encrypt(bytea, bytea, text) RETURNS bytea
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/pgcrypto', 'pg_encrypt';


ALTER FUNCTION public.encrypt(bytea, bytea, text) OWNER TO postgres;

--
-- Name: encrypt_iv(bytea, bytea, bytea, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION encrypt_iv(bytea, bytea, bytea, text) RETURNS bytea
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/pgcrypto', 'pg_encrypt_iv';


ALTER FUNCTION public.encrypt_iv(bytea, bytea, bytea, text) OWNER TO postgres;

```
