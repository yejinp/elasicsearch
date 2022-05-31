#!bin/bash

home=$(dirname $0)
source ${home}/es.env
[ -z ${ES_HOST} ]  && ES_HOST="localhost"
[ -z ${ES_PORT} ]  && ES_PORT="9200"

url="${ES_HOST}:${ES_PORT}/my_index_1/_search?pretty"
header="Content-Type: application/json"

curl -H "${header}" -XGET ${url} -d '
{
	"query": {
		"bool": {
			"must": [{
					"match": {
						"title": "relationships"
					}
				},
				{
					"match": {
						"user.name": "John"
					}
				}
			]
		}
	}
}
'