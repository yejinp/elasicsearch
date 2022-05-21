#/bin/bash

home=$(dirname $0)
source ${home}/es.env
[ -z ${ES_HOST} ]  && ES_HOST="localhost"
[ -z ${ES_PORT} ]  && ES_PORT="9200"

url="${ES_HOST}:${ES_PORT}/megacorp/employee/1?pretty"

curl -H "Content-Type: application/json" -XPUT ${url}  -d '
{
	"first_name" : "John",
	"last_name" : "Smith",
	"age" : 25,
	"about" : "I love to go rock climbing",
	"interests": [ "sports", "music" ]
}
'

