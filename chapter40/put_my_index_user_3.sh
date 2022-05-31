#!bin/bash

home=$(dirname $0)
source ${home}/es.env
[ -z ${ES_HOST} ]  && ES_HOST="localhost"
[ -z ${ES_PORT} ]  && ES_PORT="9200"

url="${ES_HOST}:${ES_PORT}/my_index/user/3?pretty"
header="Content-Type: application/json"

curl -H "${header}" -XPUT ${url} -d '
{
	"name": "Alice John",
	"email": "alice@john.com",
	"dob": "1979/01/04"
}

'
