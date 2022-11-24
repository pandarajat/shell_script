#!/bin/bash
auth_token=VFFxaE1qUGx2SE1oVmZ2TDk4SUh5QT09
version=2.3
update_for=all
merchant_id=9
api_url=https://testing-cloud.imprintnext.io/api/v1/saas/update-schema
max_execution_time=10

schema_upgrade_status=$(curl -X POST $api_url -d '{"auth_token":"'$auth_token'","version":"'$version'","update_for":"'$update_for'","merchant_id":"'$merchant_id'"}' | jq -r  '.remaining')
echo "Remaining status : '$schema_upgrade_status'"

for (( i=$max_execution_time; i>0; i-- ))
do
    if [[ "$schema_upgrade_status" > 0 ]]
    then
        schema_upgrade_status=$(curl -X POST $api_url -d '{"auth_token":"'$auth_token'","version":"'$version'","update_for":"'$update_for'","merchant_id":"'$merchant_id'"}' | jq -r  '.remaining')

        echo "Remaining status $i : '$schema_upgrade_status'"

elif [[ "$i" == '5' ]]
then
        echo " $i!"
        break
    fi
echo "$i"
done
echo "end"
