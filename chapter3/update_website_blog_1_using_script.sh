#!bin/bash

# null pointer_exception"
home=$(dirname $0)
source ${home}/es.env
[ -z ${ES_HOST} ]  && ES_HOST="localhost"
[ -z ${ES_PORT} ]  && ES_PORT="9200"

url="${ES_HOST}:${ES_PORT}/website/blog/1/_update?pretty"

curl -H "Content-Type: application/json" -XPOST ${url}  -d '
{
    "script" : "ctx._source.views+=1"
}
'
