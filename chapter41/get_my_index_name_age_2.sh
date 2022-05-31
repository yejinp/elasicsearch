#!bin/bash

home=$(dirname $0)
source ${home}/es.env
[ -z ${ES_HOST} ]  && ES_HOST="localhost"
[ -z ${ES_PORT} ]  && ES_PORT="9200"

url="${ES_HOST}:${ES_PORT}/_search?pretty"
header="Content-Type: application/json"

curl -H "${header}" -XGET ${url} -d '
{
	"query": {
		"bool": {
			"must": [{
					"match": {
						"comments.name": "Alice"
					}
				},
				{
					"match": {
						"comments.age": 31
					}
				}
			]
		}
	}
}
'
