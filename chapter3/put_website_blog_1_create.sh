#!bin/bash

home=$(dirname $0)
source ${home}/es.env
[ -z ${ES_HOST} ]  && ES_HOST="localhost"
[ -z ${ES_PORT} ]  && ES_PORT="9200"

url="${ES_HOST}:${ES_PORT}/website/blog/1?pretty"

curl -H "Content-Type: application/json" -XPUT ${url}  -d '
{
 "title": "My first blog entry",
 "text": "Just trying this out..."
}
'
