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
 { "add": { "index": "tweets_2", "alias": "tweets_search" }},
 { "remove": { "index": "tweets_1", "alias": "tweets_index" }},
 { "add": { "index": "tweets_2", "alias": "tweets_index" }}
 ]
}
'
