#!bin/bash

home=$(dirname $0)
source ${home}/es.env
[ -z ${ES_HOST} ]  && ES_HOST="localhost"
[ -z ${ES_PORT} ]  && ES_PORT="9200"

url="${ES_HOST}:${ES_PORT}/my_index_2/blogpost/2?pretty"
header="Content-Type: application/json"

curl -H "${header}" -XPUT ${url} -d '
{
	"title": "Relationships",
	"body": "It\u0027s complicated...",
	"user": {
		"id":1,
		"name": "John Smith"
	}
}

'