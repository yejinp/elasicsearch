#!bin/bash

home=$(dirname $0)
source ${home}/es.env
[ -z ${ES_HOST} ]  && ES_HOST="localhost"
[ -z ${ES_PORT} ]  && ES_PORT="9200"

url="http://${ES_HOST}:${ES_PORT}/us/tweet/_search?explain&pretty"
header="Content-Type: application/json"

curl -H "${header}" -XGET ${url}  -d '
{
	"query":{ 
		"bool": {
		"must": [{"term":{"user_id":2}},
		{"match": {"tweet": "honeymoon"}}]
	}
}
}
'
