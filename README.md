# tar-backup
Simply bash script that create tar.gz for elements on $work_dir to $backup_dir and send to mail account. Additionally rotate backups files, you can define time on $days_left

Author: m0rfeo

# Usage
This script have to be runned as super-user if you want to backup files with root permissions. Remember to give to that script properly permissions to execute (chmod 711) and root owner if you need it (chown root:root).

Additionally remember to add this script on your crontab to automate the process, i recomended to run this script once a day.


# Required packages
mailutils package is required to send email with files on $backup_dir to admin mail.
