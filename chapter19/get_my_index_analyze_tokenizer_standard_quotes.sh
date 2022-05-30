#!bin/bash

home=$(dirname $0)
source ${home}/es.env
[ -z ${ES_HOST} ]  && ES_HOST="localhost"
[ -z ${ES_PORT} ]  && ES_PORT="9200"

url="${ES_HOST}:${ES_PORT}/my_index/_analyze?pretty"
header="Content-Type: application/json"

curl -H "${header}" -XGET ${url} -d '
{
	"analyzer": "quotes_analyzer",
	"text" : "You\u0027re my \u0027favorite\u0027 M\u0027Coy"
}
'
