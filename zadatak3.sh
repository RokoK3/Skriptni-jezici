#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Unesite putanju do log datoteka kao argument"
    exit 1
fi

for file in $(ls $1) ; do
    if [ $(echo $1/$file | cut -d'-' -f2) = "02" ]; then #pogledaj je li u imenu datoteke 02 izmedu dvije crtice
        sed -n '1p' "$1/$file" | sed -r 's/.*([0-9]{2})\/(Feb)\/([0-9]{4}).*/datum: \1-02-\3/' #ispisi "header" tj datum 
        echo "--------------------------------------------------------------------------------------------"
        cat "$1/$file" | cut -d'"' -f 2 | sort | uniq -c | sort -rn | sed -r 's/\s+([0-9]*)(\s+)(.*)/ \1  :  \3/' #ispisi broj ponavljanja i requestove
        echo ''
    fi
done
