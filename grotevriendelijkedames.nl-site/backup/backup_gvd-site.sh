#!/bin/bash

BASE_PATH=`pwd`

source ${BASE_PATH}/utils/read_configuration.sh

read_config "/home/config/gvd_site.properties"

DATE=`date +%Y-%m-%d`
BASE_DIR=/home/backup/grotevriendelijkedames.nl/today
WWW_DIR=/home/sites

echo "[INFO] Backup MySQL schema : ${SQL_SCHEMA}"
mysqldump -u ${SQL_USER} -p${SQL_PASSWORD} ${SQL_SCHEMA} --host=${SQL_HOST} --port=${SQL_PORT} > ${BASE_DIR}/${DATE}_gvd.sql
if [[ ${?} != 0 ]]; then
  echo "[ERROR] mysqldump failed"
  exit 1
fi

echo "[INFO] Backup data directory : ${WWW_DIR}/wwww.grotevriendelijkdames.nl/"
tar -cvf ${BASE_DIR}/${DATE}_gvd.tar ${WWW_DIR}/www.grotevriendelijkedames.nl/

