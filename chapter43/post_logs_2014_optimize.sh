#!bin/bash

home=$(dirname $0)
source ${home}/es.env
[ -z ${ES_HOST} ]  && ES_HOST="localhost"
[ -z ${ES_PORT} ]  && ES_PORT="9200"

url="${ES_HOST}:${ES_PORT}/logs_2014-09-30/_settings?pretty"
header="Content-Type: application/json"

curl -H "${header}" -XPUT ${url}  -d '
{
	"max_num_segments":1
}
'
