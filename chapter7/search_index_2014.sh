#!bin/bash

home=$(dirname $0)
source ${home}/es.env
[ -z ${ES_HOST} ]  && ES_HOST="localhost"
[ -z ${ES_PORT} ]  && ES_PORT="9200"

header="Content-Type: application/json"
url="http://${ES_HOST}:${ES_PORT}/index_2014*/type1,type2/_search?pretty"

curl -H "${header}" -XGET ${url}  -d '
{}
'
