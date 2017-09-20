#!/bin/sh -u

VersionChecker=$(cat /etc/os-release | grep "^ID=")

if [ "$VersionChecker" = "ID=ubuntu"  ] ; then
        echo "You are running a version of Debian"
        echo "The installer may proceed with the privilege check"
else
        echo "You are not running a version of Debian"
        echo "Please run this software on a Debian or Debian-compatible distro"
        echo "The installer will now quit"
        exit 1
fi
