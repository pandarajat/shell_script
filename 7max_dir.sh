#!/bin/bash 
LOCATION=/tmp/dir
FILECOUNT=$(find $LOCATION -maxdepth 1 -type f | wc -l)
DIRCOUNT=$(find $LOCATION -maxdepth 1 -type d | wc -l)
echo " files are: $FILECOUNT "
echo "directories are: $DIRCOUNT "

for ((a=$DIRCOUNT; a>=7; a--))
do
FILENAME=$(ls -t1 $LOCATION | tail -n 1)
 echo "$LOCATION/$FILENAME"
sudo  rm -rf $LOCATION/$FILENAME
 echo " $FILENAME"
 echo " $FILENAME is delete"
 DIRCOUNT=$(find $LOCATION -maxdepth 1 -type d | wc -l)

echo  "$DIRCOUNT"
done
echo "it needs more backup"



   
