#!bin/bash

home=$(dirname $0)
source ${home}/es.env
[ -z ${ES_HOST} ]  && ES_HOST="localhost"
[ -z ${ES_PORT} ]  && ES_PORT="9200"

url="${ES_HOST}:${ES_PORT}/megacorp/employee/_mapping?pretty"
curl -H "Content-Type: application/json" -XPUT ${url}  -d  '
{
    "employee" : {
    "properties" : {
    "about" : {
    "type" : "text",
    "fields" : {
    "keyword" : {
    "type" : "keyword",
    "ignore_above" : 256
}
}
},
"age" : {
"type" : "long"
},
"first_name" : {
"type" : "text",
"fields" : {
"keyword" : {
"type" : "keyword",
"ignore_above" : 256
}
}
},
"interests" : {
"type" : "text",
"fielddata": true,
"fields" : {
"keyword" : {
"type" : "keyword",
"ignore_above" : 256
}
}
},
"last_name" : {
"type" : "text",
"fields" : {
"keyword" : {
"type" : "keyword",
"ignore_above" : 256
}
}
}
}
}
}
'
