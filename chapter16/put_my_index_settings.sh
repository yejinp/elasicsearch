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
 "autocomplete_filter": {
 "type": "edge_ngram",
 "min_gram": 1,
 "max_gram": 20
 }
 },
 "analyzer": {
 "autocomplete": {
 "type": "custom",
 "tokenizer": "standard",
 "filter": [
 "lowercase",
 "autocomplete_filter"
 ]
 }
 }
 }
 }

}

'
