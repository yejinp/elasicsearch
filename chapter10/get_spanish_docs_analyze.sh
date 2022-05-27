#!bin/bash

home=$(dirname $0)
source ${home}/es.env
[ -z ${ES_HOST} ]  && ES_HOST="localhost"
[ -z ${ES_PORT} ]  && ES_PORT="9200"

url="http://${ES_HOST}:${ES_PORT}/spanish_docs/_analyze?pretty"
header="Content-Type: application/json"

curl -H "${header}" -XPOST ${url}  -d '
{
	"analyzer": "es_std",
	"text" : "El veloz zorro marrón"
}
'
