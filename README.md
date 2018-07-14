# Nextcloud-backup

# Howto use:

Change the following enviroment variables how you like them:

- VAR PART
sourcePath="/NAS/cloud" 
>> Source Path, eg. whole nextcloud dir or just one user's data
destPath="/media/Backup/Nextcloud" 
> Folder in which the backup will be crated. TAR & SQL Dump well be there.

- DATA PART
nameData="nextcloud_data.tar.gz" 
> Name of backup TAR file. Script will add the current date (YYYY-MM-DD_) in front of the file name!

- SQL PART
nameSQL="nextcloud_mysql.sql" 
> Name of backup SQL Dump. Script will add the current date (YYYY-MM-DD_)  in front of the file name!

- DELETE Backup older than 4 Weeks
find $destPath -maxdepth 1 -type f -iname '*.tar.gz' -mtime +28 -exec rm {} \; 
>> Change the number 28 if you want the backups to last longer or less long before deletion
find $destPath -maxdepth 1 -type f -iname '*.sql' -mtime +28 -exec rm {} \; 
> Change the number 28 if you want the backups to last longer or less long before deletion

- BACKUP PART
mysqldump --lock-tables -h 127.0.0.1 -u MYSQLUSER -p'PASSWORD' NEXTCLOUDDB > $destPath/$fileNameSQL 
> Change all the parts in capital letters!
