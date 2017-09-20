#!/bin/sh -u

# Lab Midterm Script
# Feb. 27, 2017
# Kurt Grosser

echo Kurt Grosser
echo gros0059
echo

echo 1. Unmount /dev/sde1
echo --------------------
echo
umount /dev/sde1
echo

echo 2. Convert /dev/sde1 to a physical volume
echo -----------------------------------------
echo 
pvcreate /dev/sde1 
echo

echo 3. List all Physical Volumes
echo ----------------------------
echo
pvs
echo

echo 4. Adding /dev/sde1 to cl group
echo -------------------------------
echo
vgextend cl /dev/sde1
echo

echo 5. List all Volume Groups
echo -------------------------
echo
vgs
echo

echo 6. Removing /dev/sde1 from cl group
echo -----------------------------------
echo
vgreduce cl /dev/sde1
echo

echo 7. List all Physical Volumes
echo ----------------------------
echo
pvs
echo

echo 8. Formatting /dev/sdf1 as ext4
echo -------------------------------
echo
mkfs.ext4 /dev/sdf1
echo

echo 9. Display /dev/sdf1 filesystem
echo -------------------------------
echo
file -sL /dev/sdf1
echo

echo 10. Display Kernel Version
echo --------------------------
echo
uname -r
echo

echo 11. Current status of RAID Arrays
echo ---------------------------------
echo
mdadm --detail /dev/md125 | grep ^/
mdadm --detail /dev/md125 | grep '^          State' 
mdadm --detail /dev/md126 | grep ^/
mdadm --detail /dev/md126 | grep '^          State'
mdadm --detail /dev/md127 | grep ^/
mdadm --detail /dev/md127 | grep '^          State'
echo

echo END OF FILE
