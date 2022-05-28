#!bin/bash

home=$(dirname $0)
source ${home}/es.env
[ -z ${ES_HOST} ]  && ES_HOST="localhost"
[ -z ${ES_PORT} ]  && ES_PORT="9200"

url="${ES_HOST}:${ES_PORT}/cars/transactions/_search?pretty"
header="Content-Type: application/json"

curl -H "${header}" -XGET ${url} -d '
{
"size":0,
"aggs": {
	"price": {
		"histogram": {
			"field": "price",
			"interval": 20000
		},
		"aggs": {
			"revenue": {
				"sum": {
					"field": "price"
				}
			}
		}
	}
}
}
'
