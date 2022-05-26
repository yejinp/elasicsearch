#!bin/bash

home=$(dirname $0)
source ${home}/es.env
[ -z ${ES_HOST} ]  && ES_HOST="localhost"
[ -z ${ES_PORT} ]  && ES_PORT="9200"

url="${ES_HOST}:${ES_PORT}/my_index/_mapping/my_type?pretty"
header="Content-Type: application/json"

curl -H "${header}" -XPUT ${url} -d '
{
	"my_type": {
 "properties": {
 "name": {
 "type": "text",
 "index_analyzer": "autocomplete",
 "search_analyzer": "standard"
 }
 }
 }
}

'
