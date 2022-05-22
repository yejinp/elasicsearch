#!bin/bash

home=$(dirname $0)
source ${home}/es.env
[ -z ${ES_HOST} ]  && ES_HOST="localhost"
[ -z ${ES_PORT} ]  && ES_PORT="9200"

url="${ES_HOST}:${ES_PORT}/_all/tweet/_search?pretty&q=%2Bname%3Ajohn+%2Btweet%3Amary"

curl -H "Content-Type: application/json" -XGET "${url}" 
