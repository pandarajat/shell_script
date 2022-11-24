#!/bin/bash
#post for rollback-schema
API=$(curl -X POST https://testing-cloud.imprintnext.io/api/v1/saas/rollback-schema  -d  '{"auth_token": "VFFxaE1qUGx2SE1oVmZ2TDk4SUh5QT09" , "update_for": "all"}' | jq -r '.remaining' )
echo "$API"
for (( i=$API; i>0; i-- ))
 do
 echo "run command for  rolback_schema "
curl -X POST https://testing-cloud.imprintnext.io/api/v1/saas/rollback-schema  -d  '{"auth_token": "VFFxaE1qUGx2SE1oVmZ2TDk4SUh5QT09" , "update_for": "all"}'
done
