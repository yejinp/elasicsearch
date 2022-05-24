#!bin/bash

home=$(dirname $0)
source ${home}/es.env
[ -z ${ES_HOST} ]  && ES_HOST="localhost"
[ -z ${ES_PORT} ]  && ES_PORT="9200"

url="${ES_HOST}:${ES_PORT}/my_store/_analyze?pretty"
header="Content-Type: application/json"

curl -H "${header}" -XPOST ${url} -d '
{
	"analyzer": "standard",
	"text" : "XHDK-A-1293-#fJ3"
}
'
