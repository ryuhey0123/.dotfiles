#! /bin/bash

for FILEPATH in $@
do
    FILENAME=${FILEPATH##*/}
    DIRNAME=${FILEPATH%/*}


    NAME=${FILENAME%.*}
    EXTNAME=${FILEPATH##*.}
    VALUE=`echo "$NAME" | sed -e "s/^[0-9]*[_]//"`
    DATE=`echo "$NAME" | sed -e "s/[^0-9].*//"`
    NEWNAME="${VALUE}_${DATE}.${EXTNAME}"
    
    

    echo "rename ${FILEPATH} to ${DIRNAME}/${NEWNAME}"

done

