#! /bin/bash

if [ ! -e "$1" ]; then
	echo "File not found/readable"
fi

while read word;
do
	set $word
	sed -e "/^$word /d"
done < "$1"
