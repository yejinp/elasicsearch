#!bin/bash

home=$(dirname $0)
source ${home}/es.env
[ -z ${ES_HOST} ]  && ES_HOST="localhost"
[ -z ${ES_PORT} ]  && ES_PORT="9200"

url="${ES_HOST}:${ES_PORT}/my_index?pretty"
header="Content-Type: application/json"

curl -H "${header}" -XPUT ${url} -d '
{
	"mappings": {
		"blogpost": {
			"properties": {
				"comments": {
					"type": "nested",
					"properties": {
						"name": {
							"type": "text"
						},
						"comment": {
							"type": "text"
						},
						"age": {
							"type": "short"
						},
						"stars": {
							"type": "short"
						},
						"date": {
							"type": "date"
						}
					}
				}
			}
		}
	}
}
'
