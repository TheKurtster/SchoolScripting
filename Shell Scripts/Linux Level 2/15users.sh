#!/bin/sh -u

# 15 Users Script
# Kurt Grosser --- kurtgrosser.com
# Script that creates 15 users using
# the newusers command

if [ "$#" -ne 2 ] ; then
	echo 1>&2 "$0: You have done one of the following:"
	echo 1>&2 "$0: - Failed to supply a prefix"
	echo 1>&2 "$0: - Failed to supply a description"
	echo 1>&2 "$0: - Forgot to quote your GECOS Field"
	echo 1>&2 "$0: - Supplied to many argument to the script"
	echo 1>&2 "$0: Please use the script in the following manner:"
	echo 1>&2 "Usage: $0 dog 'Dog Department'"
	exit 1
fi

case "$1" in
'' ) echo "Empty String Usage: $0 dog 'Dog Department'"
exit 2 ;;
*[![:alnum:]]* ) echo "Non-alpahnumeric entry '$1' Usage: $0 dog 'Dog Department'"
exit 3 ;;
esac

case "$2" in
'' ) echo "Empty String Usage: $0 dog 'Dog Department'"
exit 4 ;;
*[![:alnum:][:blank:]]* ) echo "Non-alphanumeric Entry '$2' Usage: $0 dog 'Dog Department'"
exit 5 ;;
esac

for i in 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15; do
	
	namevar="$1user$i"
	gecosvar="$2"
	ugid="10$i"
	passvar=$(openssl rand -base64 12)
	homevar="/home/$namevar"
	shellvar="/bin/bash"
	
	echo $namevar:$passvar:$ugid:$ugid:$gecosvar:$homevar:$shellvar

done
