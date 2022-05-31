#!bin/bash

home=$(dirname $0)
source ${home}/es.env
[ -z ${ES_HOST} ]  && ES_HOST="localhost"
[ -z ${ES_PORT} ]  && ES_PORT="9200"

url="${ES_HOST}:${ES_PORT}/my_index/blogpost/1?pretty"
header="Content-Type: application/json"

curl -H "${header}" -XPUT ${url} -d '
{
	"title": "Nest eggs",
	"body": "Making your money work...",
	"tags": ["cash", "shares"],
	"comments": [{
			"name": "John Smith",
			"comment": "Great article",
			"age": 28,
			"stars": 4,
			"date": "2014-09-01"
		},
		{
			"name": "Alice White",
			"comment": "More like this please",
			"age": 31,
			"stars": 5,
			"date": "2014-10-22"
		}
	]
}
'
