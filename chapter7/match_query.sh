#!bin/bash

home=$(dirname $0)
source ${home}/es.env
[ -z ${ES_HOST} ]  && ES_HOST="localhost"
[ -z ${ES_PORT} ]  && ES_PORT="9200"

url="http://${ES_HOST}:${ES_PORT}/_search?pretty"
header="Content-Type: application/json"

curl -H "${header}" -XGET ${url}  -d '
{
	"query":{
		"match":{"tweet":"About Search"}
	} 
}
'

curl -H "${header}" -XGET ${url}  -d '
{
	"query":{
		"match":{"age":26}
	} 
}
'

curl -H "${header}" -XGET ${url}  -d '
{
	"query":{
		"match":{"public": true}
	} 
}
'

curl -H "${header}" -XGET ${url}  -d '
{
	"query":{
		"match":{"tag": "full_text"}
	} 
}
'
