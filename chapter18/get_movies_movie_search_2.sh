#!bin/bash

home=$(dirname $0)
source ${home}/es.env
[ -z ${ES_HOST} ]  && ES_HOST="localhost"
[ -z ${ES_PORT} ]  && ES_PORT="9200"

url="http://${ES_HOST}:${ES_PORT}/blogs-*/post/_search?pretty"
header="Content-Type: application/json"

curl -H "${header}" -XGET ${url}  -d '
{
	"query": {
		"multi_match": {
			"query": "club de la lucha",
			"fields": ["title*^1.5", "title.general"],
			"type": "most_fields",
			"minimum_should_match": "75%"
		}
	}
}
'
