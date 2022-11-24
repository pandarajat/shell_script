#!/bin/bash
LOCATION=/tmp/dir
FILECOUNT=$(find $LOCATION -maxdepth 1 -type f | wc -l)
DIRCOUNT=$(find $LOCATION -maxdepth 1 -type d | wc -l)
echo " files are: $FILECOUNT "
echo "directories are: $DIRCOUNT "

for ((a=$DIRCOUNT; a>8; a--))
do
DIRNAME=$(ls -t1 $LOCATION | tail -n 1)
 echo "$LOCATION/$DIRNAME"
 sudo rm -rf $LOCATION/$DIRNAME
 echo " $DIRNAME"
 echo " $DIRNAME is delete"
 DIRCOUNT=$(find $LOCATION -maxdepth 1 -type d | wc -l)

echo  "Reset-directories are : $DIRCOUNT "
done
echo "it needs more backup"




   
