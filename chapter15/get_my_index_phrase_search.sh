#!bin/bash

home=$(dirname $0)
source ${home}/es.env
[ -z ${ES_HOST} ]  && ES_HOST="localhost"
[ -z ${ES_PORT} ]  && ES_PORT="9200"

header="Content-Type: application/json"
url="${ES_HOST}:${ES_PORT}/my_index/my_type/_search?pretty"

curl -H "${header}" -XGET ${url} -d '
{
	"query" : {
		"match_phrase" : {
			"title" : "quick brown fox"
		}
	}
}
'
