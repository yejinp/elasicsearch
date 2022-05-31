#!bin/bash

home=$(dirname $0)
source ${home}/es.env
[ -z ${ES_HOST} ]  && ES_HOST="localhost"
[ -z ${ES_PORT} ]  && ES_PORT="9200"

url="${ES_HOST}:${ES_PORT}/fs/file/1?pretty"
header="Content-Type: application/json"

curl -H "${header}" -XPUT ${url} -d '
{
	"name": "README.txt",
	"path": "/clinton/projects/elasticsearch",
	"contents": "Starting a new Elasticsearch project is easy..."
}

'
