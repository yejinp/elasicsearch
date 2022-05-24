#!bin/bash

home=$(dirname $0)
source ${home}/es.env
[ -z ${ES_HOST} ]  && ES_HOST="localhost"
[ -z ${ES_PORT} ]  && ES_PORT="9200"

url="${ES_HOST}:${ES_PORT}/logstash-2014-10/_optimize?max_num_segments=1&pretty"
header="Content-Type: application/json"

curl -H "${header}" -XPOST ${url} 
