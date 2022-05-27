#!bin/bash

home=$(dirname $0)
source ${home}/es.env
[ -z ${ES_HOST} ]  && ES_HOST="localhost"
[ -z ${ES_PORT} ]  && ES_PORT="9200"

url="${ES_HOST}:${ES_PORT}/spanish_docs?pretty"
header="Content-Type: application/json"

curl -H "${header}" -XPUT ${url} -d '
{
	"settings": {
	"analysis": {
	"analyzer": {
	"es_std": {
	"type": "standard",
	"stopwords": "_spanish_"
}
}
}
}
}
'
