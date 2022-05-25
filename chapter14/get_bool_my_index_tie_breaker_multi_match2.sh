#!bin/bash

home=$(dirname $0)
source ${home}/es.env
[ -z ${ES_HOST} ]  && ES_HOST="localhost"
[ -z ${ES_PORT} ]  && ES_PORT="9200"

url="${ES_HOST}:${ES_PORT}/my_index/_search?pretty"
header="Content-Type: application/json"

curl -H "${header}" -XGET ${url} -d '
{
	"query" : {
		"multi_match": {
			"query": "Quick brown fox",
			"type": "best_fields",
			"fields": [ "title", "body" ],
			"tie_breaker": 0.3,
			"minimum_should_match": "30%"
	 	}
	}
}
'
