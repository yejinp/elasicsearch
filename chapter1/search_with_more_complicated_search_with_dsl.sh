#/bin/bash

home=$(dirname $0)
source ${home}/es.env
[ -z ${ES_HOST} ]  && ES_HOST="localhost"
[ -z ${ES_PORT} ]  && ES_PORT="9200"

url="${ES_HOST}:${ES_PORT}/megacorp/employee/_search?pretty"
curl -H "Content-Type: application/json" -XGET ${url}  -d '
{
	"query" : {
		"bool":{
			"filter" : [
				{ "range" : {"age" : { "gt" : 30 }}},
				{"term": {"last_name" : "smith"}}
	  		]
		}
	}
}
'
