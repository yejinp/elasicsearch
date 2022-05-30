#!bin/bash

home=$(dirname $0)
source ${home}/es.env
[ -z ${ES_HOST} ]  && ES_HOST="localhost"
[ -z ${ES_PORT} ]  && ES_PORT="9200"

url="${ES_HOST}:${ES_PORT}/my_index?pretty"
header="Content-Type: application/json"

curl -H "${header}" -XPUT ${url} -d '
{
	"settings": {
		"analysis": {
			"filter": {
				"my_synonym_filter": {
					"type": "synonym",
					"synonyms": [
						"united states,u s a,united states of america=>usa"
					]
				}
			},
			"analyzer": {
				"my_synonyms": {
					"tokenizer": "standard",
					"filter": [
						"lowercase",
						"my_synonym_filter"
					]
				}
			}
		}
	}
}

'
