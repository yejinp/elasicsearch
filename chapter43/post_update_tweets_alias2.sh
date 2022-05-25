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
		{ "add": { "alias": "logs_current", "index": "logs_2014-10" }},
		{ "remove": { "alias": "logs_current", "index": "logs_2014-09" }},
		{ "add": { "alias": "last_3_months", "index": "logs_2014-10" }},
		{ "remove": { "alias": "last_3_months", "index": "logs_2014-07" }}
	]
}
'
