#!/bin/bash

sleep 22

dir=$1
backupdir=$2
max_backups=$3

mkdir -p "$backupdir"

if [ ! -f directory-info.last ]; then
    ls -lR "$dir" > directory-info.last
fi

ls -lR "$dir" > directory-info.new

if ! cmp -s directory-info.last directory-info.new; then
    current_date=$(date +"%Y-%m-%d-%H-%M-%S")
    cp -r "$dir" "$backupdir/$current_date"
    mv directory-info.new directory-info.last
else
    rm directory-info.new
fi

dir_count=$(ls "$backupdir" | wc -l)
if [ "$dir_count" -gt "$max_backups" ]; then
    oldest=$(ls "$backupdir" | head -n 1)
    rm -rf "$backupdir/$oldest"
fi
