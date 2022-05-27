#!bin/bash

home=$(dirname $0)
source ${home}/es.env
[ -z ${ES_HOST} ]  && ES_HOST="localhost"
[ -z ${ES_PORT} ]  && ES_PORT="9200"

#url="${ES_HOST}:${ES_PORT}/old_index/_search?search_type=scan&scroll=1m&pretty"
url="${ES_HOST}:${ES_PORT}/old_index/_search?scroll=1m&pretty"
header="Content-Type: application/json"

curl -H "${header}" -XGET ${url} -d '
{
	"query": {
	"range": {
 "date": {
 "gte": "2014-01-01",
 "lt": "2014-02-01"
 }
 }
},
"size": 1000
}
'
