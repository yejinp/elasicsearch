#!bin/bash

home=$(dirname $0)
source ${home}/es.env
[ -z ${ES_HOST} ]  && ES_HOST="localhost"
[ -z ${ES_PORT} ]  && ES_PORT="9200"

url="${ES_HOST}:${ES_PORT}/_aliases?pretty"
header="Content-Type: application/json"

curl -H "${header}" -XPOST ${url} -d '
{
	"actions": [
		{ "remove": { "index": "my_index_v1", "alias": "my_index" }},
		{ "add": { "index": "my_index_v2", "alias": "my_index" }}
	]
}
'
