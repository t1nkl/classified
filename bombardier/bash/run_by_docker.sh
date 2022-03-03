#!/bin/bash
RESOURCES="./resources/by.txt"

if test -f "$RESOURCES";
then
    echo "File: $RESOURCES - exists."
else
    echo "File: $RESOURCES - does not exists!!!"
    exit
fi

IFS=$'\n' read -d '' -r -a lines < $RESOURCES

for i in "${lines[@]}"
do
   echo "$i"
   export URL=$i
   docker run --platform linux/amd64 -d alpine/bombardier -c 300 -d 60000h -l $URL
done
