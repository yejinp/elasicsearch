#!bin/bash

home=$(dirname $0)
source ${home}/es.env
[ -z ${ES_HOST} ]  && ES_HOST="localhost"
[ -z ${ES_PORT} ]  && ES_PORT="9200"

url="${ES_HOST}:${ES_PORT}/megacorp/employee/3?pretty"
curl -H "Content-Type: application/json" -XPUT ${url}  -d '
{
	"first_name" : "Douglas",
	"last_name" : "Fir",
	"age" : 35,
	"about": "I like to build cabinets",
	"interests": [ "forestry" ]
}
'
