#!bin/bash

home=$(dirname $0)
source ${home}/es.env
[ -z ${ES_HOST} ]  && ES_HOST="localhost"
[ -z ${ES_PORT} ]  && ES_PORT="9200"

header="Content-Type: application/json"
url="${ES_HOST}:${ES_PORT}/_cluster/health?wait_for_status=green&pretty"

curl -H "${header}"  -XGET ${url}  
