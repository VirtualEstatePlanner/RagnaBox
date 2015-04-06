#!/bin/bash

service mysql start
mysql -u root < /var/lib/mysql/import.sql
cd /usr/bin/rAthena
./athena-start start

while [ 1 ]; do
    /bin/bash
done
