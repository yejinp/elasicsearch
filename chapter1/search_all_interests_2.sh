#!bin/bash

home=$(dirname $0)
source ${home}/es.env
[ -z ${ES_HOST} ]  && ES_HOST="localhost"
[ -z ${ES_PORT} ]  && ES_PORT="9200"

url="${ES_HOST}:${ES_PORT}/megacorp/employee/_search?pretty"
curl -H "Content-Type: application/json" -XGET ${url}  -d '
{
	"aggs": {
		"all_interests": {
			"terms": { "field": "interests" },
            "aggs" : {
             "avg_age" : {
              "avg" : { "field" : "age" }
               }
            }
     		}
	}
}
'
