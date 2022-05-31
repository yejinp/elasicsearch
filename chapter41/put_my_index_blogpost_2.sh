#!bin/bash

home=$(dirname $0)
source ${home}/es.env
[ -z ${ES_HOST} ]  && ES_HOST="localhost"
[ -z ${ES_PORT} ]  && ES_PORT="9200"

url="${ES_HOST}:${ES_PORT}/my_index/blogpost/2?pretty"
header="Content-Type: application/json"

curl -H "${header}" -XPUT ${url} -d '
{
	"title": "Investment secrets",
	"body": "What they don\u0027t tell you ...",
	"tags": ["shares", "equities"],
	"comments": [{
			"name": "Mary Brown",
			"comment": "Lies, lies, lies",
			"age": 42,
			"stars": 1,
			"date": "2014-10-18"
		},
		{
			"name": "John Smith",
			"comment": "You\u0027re making it up!",
			"age": 28,
			"stars": 2,
			"date": "2014-10-16"
		}
	]
}
'
