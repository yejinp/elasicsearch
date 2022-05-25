#!bin/bash

home=$(dirname $0)
source ${home}/es.env
[ -z ${ES_HOST} ]  && ES_HOST="localhost"
[ -z ${ES_PORT} ]  && ES_PORT="9200"

url="${ES_HOST}:${ES_PORT}/forums/post/1?routing=baking&pretty"
header="Content-Type: application/json"

curl -H "${header}" -XPUT ${url}  -d '
{
	"forum_id": "baking",
	"title": "Easy recipe for ginger nuts"
}'
