#!bin/bash

home=$(dirname $0)
source ${home}/es.env
[ -z ${ES_HOST} ]  && ES_HOST="localhost"
[ -z ${ES_PORT} ]  && ES_PORT="9200"

url="${ES_HOST}:${ES_PORT}/movies?pretty"
header="Content-Type: application/json"

curl -H "${header}" -XPUT ${url} -d '
{
	"mappings": {
		"title": {
			"properties": {
				"title": {
					"type": "text",
					"fields": {
						"de": {
							"type": "text",
							"analyzer": "german"
						},
						"en": {
							"type": "text",
							"analyzer": "english"
						},
						"fr": {
							"type": "text",
							"analyzer": "french"
						},
						"es": {
							"type": "text",
							"analyzer": "spanish"
						}
					}
				}
			}
		}
	}
}
'
