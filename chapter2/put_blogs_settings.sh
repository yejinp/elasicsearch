#!bin/bash

home=$(dirname $0)
source ${home}/es.env
[ -z ${ES_HOST} ]  && ES_HOST="localhost"
[ -z ${ES_PORT} ]  && ES_PORT="9200"

url="${ES_HOST}:${ES_PORT}/blogs/_settings?pretty"

curl -H "Content-Type: application/json" -XPUT ${url}  -d '
{
	"number_of_replicas" : 1
}
'
