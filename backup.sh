#!/bin/bash
## Begin Push changes function #
push_changes(){
        full_date=$(date +"%Y-%d-%m %H:%M")
        current_path=$(pwd)
        cd $backup_path


        # Check current Git status and update
        git status
        git pull origin HEAD
        echo  "$full_date - Git status checking done." >> $logfile

        # Add to Git and commit
        git add -A
        git commit -m "Automatic backup - $full_date"
        git push origin HEAD
        echo  "$full_date - The changes are successfully pushed to the repository." >> $logfile
        cd $current_path
}
## End Push changes function #

## Begin Variable Sections #
logfile="/path/database_logs/backuplogs.log"
backup_path="/path/database_backup"
project_name="mcci"
database_name="mcci"
## End Variable Sections #

## Setup mysqldump credentials
# cd ~/
# touch .my.cnf
# nano .my.cnf
#[mysqldump]
#user=USER_NAME
#password=USER_PASSWORD




## Begin Backup script #
echo "`date +%Hh%Mm%Ss` - Varibale declearation done and script started successfully." >> $logfile

echo "`date +%Hh%Mm%Ss` - MySql backup creation for $project_name is started." >> $logfile
mysqldump $database_name > $backup_path/$project_name'_'`date +%Y%m%d%H-%Hh%Mm%Ss`.sql
wait
echo "`date +%Hh%Mm%Ss` - MySql backup creation for $project_name is completed." >> $logfile

echo "`date +%Hh%Mm%Ss` - Task for database backup is completed successfully." >> $logfile
push_changes
## End Backup script #
