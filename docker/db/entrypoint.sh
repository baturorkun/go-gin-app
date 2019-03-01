#! /usr/bin/env sh

cd /workspace/src/app

export MYSQL_PWD=batur

/usr/sbin/mysqld

mysql -uroot -p blog <  docs/sql/db.sql

