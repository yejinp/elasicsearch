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
			"char_filter": {
				"emoticons": {
					"type": "mapping",
					"mappings": [
						":)=>emoticon_happy",
						":(=>emoticon_sad"
					]
				}
			},
			"analyzer": {
				"my_emoticons": {
					"char_filter": "emoticons",
					"tokenizer": "standard",
					"filter": ["lowercase"]
				}
			}
		}
	}
}

'
