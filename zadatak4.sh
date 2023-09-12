#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Upišite putanju do foldera kao argument poziva skripte!"
    exit 1
fi

counter=1
currentMonth=01
printJanuaryHeader=0


for photo in $(ls $1 | sort); do

    yearOfPicture="$(echo $photo | sed -r "s/([0-9]{4})([0-9]{2})([0-9]{2})_.*/\1/")"
    monthOfPicture="$(echo $photo | sed -r "s/([0-9]{4})([0-9]{2})([0-9]{2})_.*/\2/")"
   
    if [ $printJanuaryHeader -eq 0 ]; then
        echo -e "\n$monthOfPicture-$yearOfPicture :"
        echo "---------"
        printJanuaryHeader=1
    fi

    if [ $monthOfPicture  != $currentMonth ]; then
        echo "--- Ukupno: $((counter - 1)) slika -----"
        counter=1
        currentMonth=$monthOfPicture
        echo -e "\n$monthOfPicture-$yearOfPicture :"
        echo "---------"        
    fi

    echo -e "\t$counter. $photo"
    counter=$((counter + 1))
    
done

echo "--- Ukupno: $((counter - 1)) slika -----"