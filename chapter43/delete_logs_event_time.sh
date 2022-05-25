#!bin/bash

home=$(dirname $0)
source ${home}/es.env
[ -z ${ES_HOST} ]  && ES_HOST="localhost"
[ -z ${ES_PORT} ]  && ES_PORT="9200"

url="${ES_HOST}:${ES_PORT}/logs/event/_query?pretty"
header="Content-Type: application/json"

curl -H "${header}" -XDELETE ${url} -d '
{
	"query": {
 		"range": {
			"@timestamp": {
			"lt": "now-90d"
			}
		}
	}
}
'
