#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Unesi 2 argumenta, kazalo i uzorak imena"
    exit 1
fi

echo "Directory: $1"
echo "File pattern: $2"

directory=$1
pattern=$2
totalCount=0

for file in $(find "$directory" -name "$pattern"); do
    lines=$(wc -l "$file" | cut -d ' ' -f1)
    totalCount=$((totalCount + lines))
done
echo "Broj redaka u traženim fileovima: $totalCount"
