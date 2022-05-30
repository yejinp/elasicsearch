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
		"movie": {
			"properties": {
				"title": {
					"type": "text"
				},
				"title_br": {
					"type": "text",
					"analyzer": "brazilian"
				},
				"title_cz": {
					"type": "text",
					"analyzer": "czech"
				},
				"title_en": {
					"type": "text",
					"analyzer": "english"
				},
				"title_es": {
					"type": "text",
					"analyzer": "spanish"
				}
			}
		}
	}
}
'
