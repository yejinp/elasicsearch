#!bin/bash

home=$(dirname $0)
source ${home}/es.env
[ -z ${ES_HOST} ]  && ES_HOST="localhost"
[ -z ${ES_PORT} ]  && ES_PORT="9200"

url="${ES_HOST}:${ES_PORT}/website/blog/2?version=5&version_type=external&pretty"
curl -H "Content-Type: application/json" -XPUT ${url} -d '
{
    "title": "My first external blog entry",
     "text": "Starting to get the hang of this..."
}
'
