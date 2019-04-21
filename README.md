## Database backup script (Bash)
Taking database backup every day is a tedious job. Folks can use the above script to automate the process.

### Getting Started
These instructions will get you a copy of the project up and running on your server.
The scripting allows for an automatic commands execution that would otherwise be executed interactively one-by-one.

### Installing
1. Give permission 
`$ chmod +x backup.sh`
2. Set cron job for the backup
```
$crontab -e
0 1 * * * /home/backup.sh
```

### Authors
* Fuzail Ahmed

### License
This project is licensed under the GNU General Public License - see the LICENSE.md file for details
