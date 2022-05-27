#!bin/bash

home=$(dirname $0)
source ${home}/es.env
[ -z ${ES_HOST} ]  && ES_HOST="localhost"
[ -z ${ES_PORT} ]  && ES_PORT="9200"

url="${ES_HOST}:${ES_PORT}/my_index?pretty"
header="Content-Type: application/json"

# "Enabling [_all] is disabled in 6.0. As a replacement, you can use [copy_to] on mapping fields to create your own catch all field
curl -H "${header}" -XPUT ${url} -d '
{
	"mappings": {
	"_default_": {
	"_all": { "enabled": false }
},
"blog": {
"_all": { "enabled": true }
}
}
}
'
