# OS : Lab 1 Assignment

## Overview
A backup and restore system implemented using bash scripts, allowing user to create up to n backups from a specified directory at x intervals of time, and restore the directory to any of the saved backups

#### Hierarchy:

directory: backup-restore-lab1
- backupd.sh
- restore.sh
- Makefile

## Prerequisites
Ensure that you have make installed using:
```bash
make --version
```
If not, you can install it by running the following commands:
```bash
sudo apt update
sudo apt install make
```

## User Guide

### Part 1: Backup a directory
To activate the backup script:
1. Make sure you're in the directory where the backupd.sh file exists
2. run:
```bash
make backup SRC_DIR=<source_dir> BACKUP_DIR=<backup_dir>
```
You can also specify the interval, and maximum backups you desire by adding:
```bash
INTERVAL=3 MAX_BACKUPS=4
```
Note that they're 3 and 4 respectively by default


### Part 2: Restoring directory from a backup
To activate the restore script:
1. Make sure you're in the directory where the restore.sh file exists
2. run:
```bash
make restore SRC_DIR=<source_dir> BACKUP_DIR=<backup_dir>
```
Note that your backup directory should be the output of the previously mentioned backup script for this script to work, as it depends on comparing timestamps of versions.

### Part 4: Cron Job



### Sample Run
### Resources:
- [Cron jobs in Linux](https://www.freecodecamp.org/news/cron-jobs-in-linux)
- [Running cron command which has a forever loop](https://unix.stackexchange.com/questions/521497/how-should-i-run-a-cron-command-which-has-forever-loop)
- [Bash Script basics](https://www.howtogeek.com/439199/15-special-characters-you-need-to-know-for-bash/)
- [Makefiles](https://www.gnu.org/software/make/manual/html_node/)




