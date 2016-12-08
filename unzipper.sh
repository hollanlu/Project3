#! /bin/bash
exec &> >(tee report)

mkdir -p unzip

unmask 644
unzip -o "$1" -d unzip

files=$(pwd)
files+=/unzip/*

for f in $files
do
	user="${f#*_}"
	user="${user%%_*}"
	fname="${f##*_}"

	mkdir -p $user
	echo $f
	cp "$f" "$fname"
	cd ..
	if [ $fname = "makefile" ]; then
		make -f ../../makefile -C $user
		make test -f ../../makefile -C $user
	fi
	cd ..
done
