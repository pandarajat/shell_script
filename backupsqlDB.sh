#!/bin/bash
mysql -h  -u root -p'' -e "show databases;" >file.txt
echo "all the database"

cat file.txt

for word in Database  information_schema mysql sys performance_schema
do
  sed -i "s/${word}//g" file.txt
done

grep '\S' file.txt > file1.txt
echo " "
echo "Backup databaseNamme is"
cat file1.txt

numberDatabases=$(wc -l  file1.txt | cut -c1)
echo "${numberDatabases}"
for (( a=1; a<=${numberDatabases}; a++ ))
do

    database=$(awk NR==$a file1.txt)

    echo "Database name is ${database}"
     #mysqldump  --single-transaction  -h  -u newuser -p123456  ${database} >/backupSQL/${database}.sql
done
