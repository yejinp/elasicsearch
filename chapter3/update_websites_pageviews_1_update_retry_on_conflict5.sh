#!bin/bash

home=$(dirname $0)
source ${home}/es.env
[ -z ${ES_HOST} ]  && ES_HOST="localhost"
[ -z ${ES_PORT} ]  && ES_PORT="9200"

url="${ES_HOST}:${ES_PORT}/websites/pageviews/1/_update?retry_on_conflict=5&pretty"

curl -H "Content-Type: application/json" -XPOST ${url} -d '
{
    "script" : "ctx._source.views+=1",
     "upsert": {
      "views": 0
       }
}
'
