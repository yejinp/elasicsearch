#!bin/bash

home=$(dirname $0)
source ${home}/es.env
[ -z ${ES_HOST} ]  && ES_HOST="localhost"
[ -z ${ES_PORT} ]  && ES_PORT="9200"

url="${ES_HOST}:${ES_PORT}/my_index/my_type/_analyze?pretty"
header="Content-Type: application/json"

#"Unknown key for a START_OBJECT in [match]."
curl -H "${header}" -XGET ${url} -d '
{
	"match": {
	"_all": "john smith marketing"
}
}
'
