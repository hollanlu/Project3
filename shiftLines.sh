#! /bin/bash

if [ ! -e "$1" ]; then
	echo "File not found/unreadable"
	exit
fi

gawk 'BEGIN{FS=" "}
	{a=$1; for (i=1;i<NF;i++) $i=$(i+1); $NF=a; print $0}' < "$1" | uniq
