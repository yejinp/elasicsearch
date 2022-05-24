#!bin/bash

home=$(dirname $0)
source ${home}/es.env
[ -z ${ES_HOST} ]  && ES_HOST="localhost"
[ -z ${ES_PORT} ]  && ES_PORT="9200"

header="Content-Type: application/json"
url="${ES_HOST}:${ES_PORT}/my_index/_settings?pretty"

curl -H "${header}" -XGET ${url}  -d '
{
	"index.search.slowlog.threshold.query.warn" : "10s",
	"index.search.slowlog.threshold.fetch.debug": "500ms",
	"index.indexing.slowlog.threshold.index.info": "5s" 
}
'
