#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Incorrect command format."
    echo "$0 <source_directory> <backup_directory>"
    exit 1
fi

dir=$1
backupdir=$2

current_backup=$(ls "$backupdir" | tail -n 1)

restore_backup() {
    backup_to_restore=$1
    rm -rf "$dir"/*
    cp -r "$backupdir/$backup_to_restore"/* "$dir/"
    echo "Restored to version: $backup_to_restore"
    current_backup=$backup_to_restore
}

while true
do
    echo -e "Enter:\n1: Restore to previous version\n2: Restore to next version\n3: Exit"
    read operation

    if [ "$operation" -eq 1 ]; then
        previous_backup=$(ls "$backupdir" | sort | grep -B 1 "$current_backup" | head -n 1)

        if [ "$previous_backup" == "$current_backup" ] || [ -z "$previous_backup" ]; then
            echo "No older backup available to restore."
        else
            restore_backup "$previous_backup"
        fi

    elif [ "$operation" -eq 2 ]; then
        next_backup=$(ls "$backupdir" | sort | grep -A 1 "$current_backup" | tail -n 1)
        
        if [ "$next_backup" == "$current_backup" ]; then
            echo "No newer backup available to restore."
        else
            restore_backup "$next_backup"
        fi

    elif [ "$operation" -eq 3 ]; then
        echo "Exiting..."
        exit 0

    else
        echo "Invalid input."
    fi
done