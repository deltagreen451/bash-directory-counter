#!/bin/bash

#code uses first argument $1 as variable for directory to be searched

allfiles=$(ls -p $1 | grep -v / | wc -l) #counts total files in directory
emptfile=0 #initialise counter for empty files
alldir=$(ls -l $1 | grep -c ^d) #counts total number of sub-directories in $1 directory
emptdir=0 #initialise counter for empty directories

for FILE in $1/*; do #loop to check every file in $1 directory
    if ! [ -s $FILE ]; then #test if file is empty
    emptfile=$((emptfile+1)) #increments empty file counter if line 11 TRUE
    fi
done

for d in $1/*/; do #loop to check every sub-directory in $1
    if ! [ "$(ls -A $d)" ]; then #test if sub-directory is empty
        emptdir=$((emptdir+1)) #increments empty directory counter if line 17 TRUE
   fi
done

fullfile=$((allfiles-emptfile)) #calculates the non-empty files
fulldir=$((alldir-emptdir)) #calculates non-empty directories

echo "The $1 directory contains:" #displays the name of directory searched
echo "$fullfile files that contain data"
echo "$emptfile files that are empty"
echo "$fulldir non-empty directories"
echo "$emptdir empty directories"

exit 0