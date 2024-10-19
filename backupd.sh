#!/bin/bash

if [ $# -ne 4 ]; then
    echo "Incorrect command format.."
    echo "$0 <source_directory> <backup_directory> <interval_seconds> <max_backups>"
    exit 1
fi

dir=$1
backupdir=$2
interval_secs=$3
max_backups=$4

# ls -lR ${dir} > directory-info.last didn't work
ls -lR "$dir" > directory-info.last

# mkdir -p "$backupdir" #3ayzenha in MakeFile ta2reeban?

current_date=$(date +"%Y-%m-%d-%H-%M-%S")
cp -r "$dir" "$backupdir/$current_date"

while true
do
    sleep "$interval_secs" # if bg, put & "generally"
    ls -lR "$dir" > directory-info.new
    if ! cmp -s directory-info.last directory-info.new; then
        echo "Backup Needed :)"
        current_date=$(date +"%Y-%m-%d-%H-%M-%S")
        cp -r "$dir" "$backupdir/$current_date"
        ls -lR "$dir" > directory-info.last
    else
        echo "Up to date :)"
        rm directory-info.new
    fi

    # dir_count=$(find "$backupdir" -mindepth 1 -type d | wc -l) ,mesh lazem
    dir_count=$(ls "$backupdir" | wc -l)

    if [ "$dir_count" -gt "$max_backups" ]; then
        oldest=$(ls "$backupdir" | head -n 1) #since subdirectories will already be listed
        rm -rf "$backupdir/$oldest"
    fi
done