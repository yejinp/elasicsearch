#!bin/bash

home=$(dirname $0)
source ${home}/es.env
[ -z ${ES_HOST} ]  && ES_HOST="localhost"
[ -z ${ES_PORT} ]  && ES_PORT="9200"

url="${ES_HOST}:${ES_PORT}/_template/my_logs?pretty"
header="Content-Type: application/json"

curl -H "${header}" -XPUT ${url} -d '
{
	"template": "logstash-*",
		"order": 1,
		"settings": {
		"number_of_shards": 1
	},
	"mappings": {
		"_default_": {
			"_all": {
			"enabled": false
			}
		}
	},
	"aliases": {
		"last_3_months": {}
	}
}
'
