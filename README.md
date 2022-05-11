# tar-backup
Simply bash script that create tar.gz for elements on $work_dir to $backup_dir and send to mail account. Additionally rotate backups files, you can define time on $days_left

# Usage
- This script have to be runned as super-user if you want to backup files with root permissions. Remember to give to that script properly permissions to execute (chmod 711) and root owner if you need it (chown root:root).

- To define all the parameters needed in the process you only need to go to start of the file and change variables 

- Additionally remember to add this script on your crontab to automate the process, highly recomended to run this script once a day.

# Required packages
mailutils package is required to send email with files on $backup_dir to admin mail.

# Misc
Author: m0rfeo

Im open to suggestions about how make the process more elegant and efficient :)

Additionally I don't know if with mail can upload very larges files, i usually use this script to backup docker-compose structure up and my backups does not exceed 600MB.
