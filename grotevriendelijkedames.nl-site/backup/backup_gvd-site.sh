#!/bin/bash

DATE=`date +%Y-%m-%d`
BASE_DIR=/home/sido/backup/today

mysqldump -pKoRn0512 gvd > ${BASE_DIR}/${DATE}_gvd.sql

tar -cvf ${BASE_DIR}/${DATE}_gvd.tar /srv/www/grotevriendelijkedames.nl/

