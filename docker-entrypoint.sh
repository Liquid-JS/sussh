#!/bin/bash

export NSS_MYSQL_PORT=${NSS_MYSQL_PORT:=3306}

if [ ! -f "/usr/local/etc/libnss-mysql-root.cfg" ]; then
    dockerize -template /usr/local/etc/libnss-mysql-root.cfg.tpl:/usr/local/etc/libnss-mysql-root.cfg
fi

if [ ! -f "/usr/local/etc/libnss-mysql.cfg" ]; then
    dockerize -template /usr/local/etc/libnss-mysql.cfg.tpl:/usr/local/etc/libnss-mysql.cfg
fi

# chmod 600 /usr/local/etc/libnss-mysql-root.cfg

/usr/sbin/sshd -D -d
