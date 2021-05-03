#!/usr/bin/python3

import os
import sys

import mysql.connector

db = mysql.connector.connect(
    host=os.getenv('NSS_MYSQL_HOST'),
    user=os.getenv('NSS_MYSQL_USER'),
    password=os.getenv('NSS_MYSQL_PASSWORD'),
    database=os.getenv('NSS_MYSQL_DB'),
    port=os.getenv('NSS_MYSQL_PORT') or 3306
)

cursor = db.cursor()
sql = "SELECT `key` FROM `keys` WHERE username = %s"
user = (sys.argv[1], )

cursor.execute(sql, user)
keys = cursor.fetchall()
keys = [k[0] for k in keys]
print('\n'.join(keys))
