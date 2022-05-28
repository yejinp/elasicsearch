#!bin/bash

home=$(dirname $0)
source ${home}/es.env
[ -z ${ES_HOST} ]  && ES_HOST="localhost"
[ -z ${ES_PORT} ]  && ES_PORT="9200"

url="${ES_HOST}:${ES_PORT}/my_index/my_type/_search?pretty"
header="Content-Type: application/json"

curl -H "${header}" -XGET ${url} -d '
{
	"query": {
 "match": {
 "title": {
 "query": "quick brown fox",
 "minimum_should_match": "30%"
 }
 }
 },
 "rescore": {
 "window_size": 50,
 "query": {
 "rescore_query": {
 "match_phrase": {
 "title": {
 "query": "quick brown fox",
 "slop": 50
 }
 }
 }
 }
 }
}

'