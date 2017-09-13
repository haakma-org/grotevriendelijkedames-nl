#!/bin/bash

SQL_PASSWORD=${1}
SQL_SCHEMA=${2}

DATE=`date +%Y-%m-%d`
BASE_DIR=/home/backup/today
WWW_DIR=/home/sites

mysqldump -p${SQL_PASSWORD} ${SQL_SCHEMA} > ${BASE_DIR}/${DATE}_gvd.sql

tar -cvf ${BASE_DIR}/${DATE}_gvd.tar ${WWW_DIR}/grotevriendelijkedames.nl/

