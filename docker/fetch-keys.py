#!/usr/bin/python3

import configparser
import os
import sys

import mysql.connector

config = configparser.ConfigParser()
config.read('/usr/local/etc/auth_keys.ini')

db = mysql.connector.connect(
    host=config['main']['host'],
    user=config['main']['username'],
    password=config['main']['password'],
    database=config['main']['database'],
    port=config['main']['port']
)

cursor = db.cursor()
sql = "SELECT `key` FROM `keys` WHERE username = %s"
user = (sys.argv[1], )

cursor.execute(sql, user)
keys = cursor.fetchall()
keys = [k[0] for k in keys]
print('\n'.join(keys))
