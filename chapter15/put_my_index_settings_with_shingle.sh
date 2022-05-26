#!bin/bash

home=$(dirname $0)
source ${home}/es.env
[ -z ${ES_HOST} ]  && ES_HOST="localhost"
[ -z ${ES_PORT} ]  && ES_PORT="9200"

url="${ES_HOST}:${ES_PORT}/my_index?pretty"
header="Content-Type: application/json"

curl -H "${header}" -XPUT ${url} -d '
{
	"settings": {
 "number_of_shards": 1,
 "analysis": {
 "filter": {
 "my_shingle_filter": {
 "type": "shingle",
 "min_shingle_size": 2,
 "max_shingle_size": 2,
 "output_unigrams": false
 }
 },
 "analyzer": {
 "my_shingle_analyzer": {
 "type": "custom",
 "tokenizer": "standard",
 "filter": [
 "lowercase",
"my_shingle_filter"
 ]
 }
 }
 }
 }
}

'
