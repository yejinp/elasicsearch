#!bin/bash

home=$(dirname $0)
source ${home}/es.env
[ -z ${ES_HOST} ]  && ES_HOST="localhost"
[ -z ${ES_PORT} ]  && ES_PORT="9200"

url="${ES_HOST}:${ES_PORT}/my_index/my_type/_search?pretty"
header="Content-Type: application/json"

curl -H "${header}" -XPOST ${url} -d '
{
	"query" : {
		"match" : {
			"title" :
		       	{
				"query": "quick brown dog",
				"minimum_should_match": "75%"
			}
		}
	}
}
'
