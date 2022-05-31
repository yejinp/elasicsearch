#!bin/bash

home=$(dirname $0)
source ${home}/es.env
[ -z ${ES_HOST} ]  && ES_HOST="localhost"
[ -z ${ES_PORT} ]  && ES_PORT="9200"

url="${ES_HOST}:${ES_PORT}/fs/_mapping/file?pretty"
header="Content-Type: application/json"

curl -H "${header}" -XPUT ${url} -d '
{
	"properties": {
		"name": {
			"type": "keyword"
		},
		"path": {
			"type": "keyword",
			"fields": {
				"tree": {
					"type": "text",
					"analyzer": "paths"
				}
			}
		}
	}
}
'
