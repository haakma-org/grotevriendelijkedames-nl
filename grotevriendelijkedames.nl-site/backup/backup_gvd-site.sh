#!/bin/bash

. ../../utils/read_configuration.sh

read_config "/home/config/gvd.properties"

DATE=`date +%Y-%m-%d`
BASE_DIR=/home/backup/today
WWW_DIR=/home/sites

echo "[INFO] Backup MySQL schema : ${SQL_SCHEMA}"
mysqldump -u ${SQL_USER} -p${SQL_PASSWORD} ${SQL_SCHEMA} > ${BASE_DIR}/${DATE}_gvd.sql

tar -cvf ${BASE_DIR}/${DATE}_gvd.tar ${WWW_DIR}/grotevriendelijkedames.nl/

