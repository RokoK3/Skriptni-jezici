#!/bin/bash


#1
grep -i -E 'banana|jabuka|jagoda|dinja|lubenica' namirnice.txt
echo ''

#2
grep -i -v -E 'banana|jabuka|jagoda|dinja|lubenica' namirnice.txt

echo ''

#3
grep -r -E '\b[A-Z]{3} [0-9]{6}\b' ~/projekti


#4
find "$(pwd)/" -mtime +7 -mtime -14 -ls


#5
for i in $(seq 1 15) ; do echo -n "$i " ; done; echo ''


#6
kraj=10; 
for i in $(seq 1 $kraj); do echo  "$i "; done;
for i in {1..$kraj}; do echo "$i " ; done;  #nemoze ici $kraj, expanzija {} prije varijable
