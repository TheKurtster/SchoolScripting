#!/bin/sh -u

# 20 Users Script
# Kurt Grosser --- kurtgrosser.com
# Script that creates 20 users using
# the newusers command

for i in 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20; do
	
	if [ "$i" = 01 ]; then
		namevar="allsj"
		gecosvar="Jefferson Alls"
	elif [ "$i" = 02 ]; then
		namevar="arrasj"
		gecosvar="Jude Arras"
	elif [ "$i" = 03 ]; then
		namevar="brummerm"
		gecosvar="Markus Brummer"
	elif [ "$i" = 04 ]; then
		namevar="colganw"
		gecosvar="Weston Colgan"
	elif [ "$i" = 05 ]; then
		namevar="cordlem"
		gecosvar="Maurine Cordle"
	elif [ "$i" = 06 ]; then
		namevar="dinhm"
		gecosvar="Mitzie Dinh"
	elif [ "$i" = 07 ]; then
		namevar="essesk"
		gecosvar="Karey Esses"
	elif [ "$i" = 08 ]; then
		namevar="falkowskil"
		gecosvar="Lizeth Falkowski"
	elif [ "$i" = 09 ]; then
		namevar="grandberrym"
		gecosvar="Mariana Grandberry"
	elif [ "$i" = 10 ]; then
		namevar="labate"
		gecosvar="Emeline Labat"
	elif [ "$i" = 11 ]; then
		namevar="kensingera"
		gecosvar="Alba Kensinger"
	elif [ "$i" = 12 ]; then
		namevar="kastenc"
		gecosvar="Criselda Kasten"
	elif [ "$i" = 13 ]; then
		namevar="mazzeim"
		gecosvar="Myrtie Mazzei"
	elif [ "$i" = 14 ]; then
		namevar="mceuenc"
		gecosvar="Charline Mceuen"
	elif [ "$i" = 15 ]; then
		namevar="petitel"
		gecosvar="Lenna Petite"
	elif [ "$i" = 16 ]; then
		namevar="rosoli"
		gecosvar="In Rosol"
	elif [ "$i" = 17 ]; then
		namevar="rubensteins"
		gecosvar="Sherley Rubenstein"
	elif [ "$i" = 18 ]; then
		namevar="sescos"
		gecosvar="Sana Sesco"
	elif [ "$i" = 19 ]; then
		namevar="twerskyw"
		gecosvar="Wanita Twersky"
	elif [ "$i" = 20 ]; then
		namevar="unzuetas"
		gecosvar="Santina Unzeuta"
	fi

	ugid="10$i"
	passvar="april2017"
	homevar="/home/$namevar"
	shellvar="/bin/bash"
	
	echo $namevar:$passvar:$ugid:$ugid:$gecosvar:$homevar:$shellvar

done
