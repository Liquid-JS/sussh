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

if [ ! -f "/sussh/host-keys/ssh_host_rsa_key" ]; then
    ssh-keygen -q -N "" -t rsa -b 4096 -f /sussh/host-keys/ssh_host_rsa_key
fi

if [ ! -f "/sussh/host-keys/ssh_host_ecdsa_key" ]; then
    ssh-keygen -q -N "" -t ecdsa -f /sussh/host-keys/ssh_host_ecdsa_key
fi

if [ ! -f "/sussh/host-keys/ssh_host_ed25519_key" ]; then
    ssh-keygen -q -N "" -t ed25519 -f /sussh/host-keys/ssh_host_ed25519_key
fi

/usr/sbin/sshd -D
