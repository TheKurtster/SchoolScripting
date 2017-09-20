#!/bin/sh -u
#PATH=/bin:/usr/bin ; export PATH
umask 002

# Kurt Grosser --- thekurtgrosser@gmail.com --- kurtgrosser.com
# Script that gives an overview of the following information
# about the machine currently in use:
# CPU Cores, RAM, Pathnames of Device Files starting with sd,
# RAID Configuration, df device file, Configured swap areas,
# mount and much more!

echo System Information
echo ------------------
echo
echo "Generated on:" $(date)
echo "Generated by:" $(whoami)
echo 'CPU Cores:' $(nproc)
echo 'Total Memory:' $(free -gh | head -2 | tail -1 | awk '{print $2}')

echo
echo Found Drives
echo ------------
echo 
echo /dev/sd?

echo
echo RAID Configuration
echo ------------------
echo
grep "md" /proc/mdstat 

echo
echo Swap Areas
echo ----------
echo
swapon

echo
echo Disk Usage
echo ----------
echo
df -h | head -1
df -h | grep ^/

echo
echo Filesystems
echo -----------
echo
mount | grep ^/


echo
echo END OF FILE
