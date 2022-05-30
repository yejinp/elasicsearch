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
				"quotes": {
					"type": "mapping",
					"mappings": [
						"\\u0091=>\\u0027",
						"\\u0092=>\\u0027",
						"\\u2018=>\\u0027",
						"\\u2019=>\\u0027",
						"\\u201B=>\\u0027"
					]
				}
			},
			"analyzer": {
				"quotes_analyzer": {
					"tokenizer": "standard",
					"char_filter": ["quotes"]
				}
			}
		}
	}
}
'
