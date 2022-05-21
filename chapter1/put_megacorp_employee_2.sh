#/bin/bash

home=$(dirname $0)
source ${home}/es.env
[ -z ${ES_HOST} ]  && ES_HOST="localhost"
[ -z ${ES_PORT} ]  && ES_PORT="9200"

url="${ES_HOST}:${ES_PORT}/megacorp/employee/2?pretty"

curl -H "Content-Type: application/json" -XPUT ${url}  -d '
{
	"first_name" : "Jane",
	"last_name" : "Smith",
	"age" : 32,
	"about" : "I like to collect rock albums",
	"interests": [ "music" ]
}
'
