#!/bin/bash

#--------------------------------------------------------------------------------------- README ---------------------------------------------------------------------------------------#
# GNU GENERAL PUBLIC LICENSE																			       #
#                       Version 3, 29 June 2007																	       #
#																						       #
# Copyright (C) 2007 Free Software Foundation, Inc. <https://fsf.org/>														       #
# Everyone is permitted to copy and distribute verbatim copies															       #
# of this license document, but changing it is not allowed.															       #
#																						       #
# Author: M0rfeo																				       #
# This script create backup files from $work_dir to $backup_dir, you can backup specific elements declared as $save, $save1, ... on backup function or create backup for all $work_dir #
# additionally this script send you backups file to $email and rotate backups files, time defined on $days_left.								       #
#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#

#vars
date=$(date +'%b-%d-%y')
backup_dir="/home/morfeo/backups"
work_dir="/home/morfeo/wor_dir"
save="logs"
save1="var"
days_left=2
email="email@gmail.com"

#Check if $backup_dir exist and else create it
checkBackupDir(){
if [ -d $backup_dir ];
then
	echo -n ""
else
        mkdir $backup_dir
fi
}

#Backup of $save parameters (you can declare more parameters, just add $save2,... on vars copy one tar instruction line
#of this function and add it on the last line of the function, remember change $save1 for your new $save parameter/s
backup(){
	checkBackupDir
	cd $work_dir
	sudo tar -czvpf $backup_dir/$save-backup-$date.tar.gz $save/
	sudo tar -czvpf $backup_dir/$save1-backup-$date.tar.gz $save1/
}

#Backup all elements on $work_dir
backupAll(){
	checkBackupDir
	cd $work_dir
	sudo tar -czvpf $backup_dir/complete-backup-$date.tar.gz .
}

#Rotate files on $backup_dir every days defined on $days_left
rotateBackup(){
	find $backup_dir/* -mtime +$days_left -exec rm --interactive=never {} \;
}

#Send all on $backup_dir to $email
sendBackupEmail(){
	cd $backup_dir && cd ../
	sudo tar -czvpf all-backup-daily-$date.tar.gz $backup_dir
	mv -f all-backup-daily-$date.tar.gz $backup_dir #WARNING: -f WILL OVERWRITE IF ANY FILE WITH THE SAME NAME EXIST
	cd $backup_dir
	mail -aFrom:$email --content-type=aplication/x-tar -s "Subject" --attach=all-backup-daily-$date.tar.gz $email <<< "Body";
}

#Exec all the functions
backup
backupAll
weeklyBackup
sendBackupEmail

