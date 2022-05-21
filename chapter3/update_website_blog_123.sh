#!bin/bash

home=$(dirname $0)
source ${home}/es.env
[ -z ${ES_HOST} ]  && ES_HOST="localhost"
[ -z ${ES_PORT} ]  && ES_PORT="9200"

url="${ES_HOST}:${ES_PORT}/website/blog/123?pretty"
curl -H "Content-Type: application/json" -XPUT ${url}  -d '
{
    "title": "My first blog entry",
    "text": "I am starting to get the hang of this...",
    "date": "2014/01/02"
}
'
