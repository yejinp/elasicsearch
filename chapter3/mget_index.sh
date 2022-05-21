#!bin/bash

home=$(dirname $0)
source ${home}/es.env
[ -z ${ES_HOST} ]  && ES_HOST="localhost"
[ -z ${ES_PORT} ]  && ES_PORT="9200"

url="${ES_HOST}:${ES_PORT}/website/blog/_mget?pretty"
curl -H "Content-Type: application/json" -XGET ${url} -d '
{
    "docs" : [
     { "_id" : 2 },
          { "_type" : "pageviews", "_id" : 1 }
           ]
}
'
