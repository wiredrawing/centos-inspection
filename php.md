
# 1.PHPのインストール

```
# 事前にphpの使用可能バージョンを確認する
dnf module list php

```

```

Failed to set locale, defaulting to C.UTF-8
Last metadata expiration check: 0:33:31 ago on Sat Sep 25 03:26:13 2021.
CentOS Linux 8 - AppStream
Name Stream Profiles Summary
php 7.2 [d] common [d], devel, minimal PHP scripting language
php 7.3 common [d], devel, minimal PHP scripting language
php 7.4 common [d], devel, minimal PHP scripting language
```

# 2.phpバージョンの7.4を有効にする

```
#php:7.4を有効にする
dnf module install php:7.4

# 上記コマンド実行後､再度 dnf module list php コマンドを実行する

dnf module list php

# Last metadata expiration check: 1:05:18 ago on Sat Sep 25 03:26:13 2021.
# CentOS Linux 8 - AppStream
# Name Stream Profiles Summary
# php 7.2 [d] common [d], devel, minimal PHP scripting language
# php 7.3 common [d], devel, minimal PHP scripting language
# php 7.4 [e] common [d] [i], devel, minimal PHP scripting language

# moduleが有効になったことを確認後､phpをインストールする

dnf install php

```


# 3.phpのインストールを確認する

```
php -v

# PHP 7.4.6 (cli) (built: May 12 2020 08:09:15) ( NTS )
# Copyright (c) The PHP Group
# Zend Engine v3.4.0, Copyright (c) Zend Technologies
#     with Zend OPcache v7.4.6, Copyright (c), by Zend Technologies

# 上記のPHPエンジンのバージョンを確認する

```

