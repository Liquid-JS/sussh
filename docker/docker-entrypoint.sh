#!/bin/bash

if [ ! -f "/usr/local/etc/libnss-mysql-root.cfg" ]; then
    dockerize -template /usr/local/etc/libnss-mysql-root.cfg.tpl:/usr/local/etc/libnss-mysql-root.cfg
fi

if [ ! -f "/usr/local/etc/libnss-mysql.cfg" ]; then
    dockerize -template /usr/local/etc/libnss-mysql.cfg.tpl:/usr/local/etc/libnss-mysql.cfg
fi

if [ ! -f "/usr/local/etc/auth_keys.ini" ]; then
    dockerize -template /usr/local/etc/auth_keys.ini.tpl:/usr/local/etc/auth_keys.ini
fi

/usr/sbin/sshd -D
