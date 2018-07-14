#!/bin/sh

#---------------#
# Nextcloud Bak #
# v0.3          #
#---------------#

#Env-Var
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin

#Var
sourcePath="/cloud"
destPath="/media/Backup/Nextcloud"
curDate=$(date +"%Y-%m-%d")
#	Data
nameData="nextcloud_data.tar.gz"
fileNameData=$(echo ${curDate}_${nameData})
#	SQL
nameSQL="nextcloud_mysql.sql"
fileNameSQL=$(echo ${curDate}_${nameSQL})


#Delete Backup older than 4 Weeks
find $destPath -maxdepth 1 -type f -iname '*.tar.gz' -mtime +28 -exec rm {} \;
find $destPath -maxdepth 1 -type f -iname '*.sql' -mtime +28 -exec rm {} \;


#Backup
tar -cvpzf $destPath/$fileNameData $sourcePath
mysqldump --lock-tables -h 127.0.0.1 -u MYSQLUSER -p'ENTER MYSQL PW' DB > $destPath/$fileNameSQL
