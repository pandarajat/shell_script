#!/bin/bash
#post for update-schema
API=$(curl  -X  POST  https://testing-cloud.imprintnext.io/api/v1/saas/update-schema -d '{"auth_token":"VFFxaE1qUGx2SE1oVmZ2TDk4SUh5QT09","version":"2.3","update_for":"all"}' | jq -r  '.remaining' )
echo "$API"

for (( i=$API; i>0; i-- ))
 do
 echo "run command for udate_schema "
    curl  -X  POST  https://testing-cloud.imprintnext.io/api/v1/saas/update-schema -d '{"auth_token":"VFFxaE1qUGx2SE1oVmZ2TDk4SUh5QT09","version":"2.3","update_for":"all"}'
done



# post for update-lang

LANGAPI=$(curl -X POST https://testing-cloud.imprintnext.io/api/v1/saas/update-lang -d '{"auth_token":"VFFxaE1qUGx2SE1oVmZ2TDk4SUh5QT09","version":"2.3","update_for":"all"}' | jq -r  '.merchant_remains' )
echo "$LANGAPI"
for (( i=$LANGAPI; i>0; i-- ))
 do
 echo "run command for update_lang"
 curl -X POST https://testing-cloud.imprintnext.io/api/v1/saas/update-lang -d '{"auth_token":"VFFxaE1qUGx2SE1oVmZ2TDk4SUh5QT09","version":"2.3","update_for":"all"}'
done
echo "Script execution end"
