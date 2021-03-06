#!/bin/sh -u
umask 002

# check-tar-backup.sh
# Kurt Grosser --- thekurtgrosser@gmail.com --- kurtgrosser.com
# Script that verifys the TAR backup created for
# CST Linux II Assignment 4.


echo Check TAR Backup Script
echo -----------------------

echo Generated on: $(date)
echo Generated by: $(whoami)
echo

TARBackupFile=/mnt/tape/backup2.tar
TMPFile=/home/gros0059/Desktop/tmpfile.txt
tar tvf $TARBackupFile >$TMPFile

echo Checking TAR backup: $TARBackupFile
echo File details for $TARBackupFile
ls -l $TARBackupFile
echo

echo Number of names found: $(wc $TMPFile | awk '{print $1}')
echo

echo First five names found:
echo
head -5 $TMPFile | awk '{print $NF}'
echo

echo Last five names found:
echo
tail -5 $TMPFile | awk '{print $NF}'
echo

rm -rf $TMPFile
echo END OF FILE