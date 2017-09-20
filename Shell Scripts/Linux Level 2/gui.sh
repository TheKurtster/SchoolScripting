#!/bin/sh -u
umask 002

# Kurt Grosser --- thekurtgrosser@gmail.com --- kurtgrosser.com
# GUI Script (version 0.1 02/06/17)
# Script that takes input variables to switch from a GUI 
# to a Multi-User Mode

HelpDialog="1 = GUI Mode, 2 = Multi-User Mode, help = This dialog"

if "$1" = 1 ; then
	echo The system will now switch to a GUI.
	sleep 10
	systemctl isolate graphical.target
fi

if "$1" = 2 ; then
	echo The system will now switch to Multi-User Mode.
	sleep 10
	systemctl isolate multi-user.target
fi

if "$1" = "help" ; then
	

if "$1" = "" ; then
	echo Please supply an integer.
	echo "./gui.sh 1 (To run the GUI)"
	echo "$HelpDialog"
	exit 1
fi

