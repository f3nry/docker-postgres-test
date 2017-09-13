#!/bin/bash

PGPASSWORD=docker pg_basebackup -h primary -w -D /var/lib/postgresql/9.6/main/data -U docker -v -P

cp /var/lib/postgresql/9.6/main/recovery.conf /var/lib/postgresql/9.6/main/data

/usr/lib/postgresql/9.6/bin/postgres -D /var/lib/postgresql/9.6/main/data -c config_file=/etc/postgresql/9.6/main/postgresql.conf
