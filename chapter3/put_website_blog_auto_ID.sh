#!bin/bash

home=$(dirname $0)
source ${home}/es.env
[ -z ${ES_HOST} ]  && ES_HOST="localhost"
[ -z ${ES_PORT} ]  && ES_PORT="9200"

url="${ES_HOST}:${ES_PORT}/website/blog?pretty"

curl -H "Content-Type: application/json" -XPOST ${url}  -d '
{
    "title": "My second blog entry",
    "text": "Still trying this out...",
    "date": "2014/01/01"
}
'
