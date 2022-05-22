#!bin/bash

home=$(dirname $0)
source ${home}/es.env
[ -z ${ES_HOST} ]  && ES_HOST="localhost"
[ -z ${ES_PORT} ]  && ES_PORT="9200"

url="http://${ES_HOST}:${ES_PORT}/tweet?pretty"
header="Content-Type: application/json"

curl -H "${header}" -XGET ${url}  -d '
{
  "tweet" : {
    "mappings" : {
      "doc" : {
	 "_all": {
        	"enabled": true
      	 },
        "properties" : {
          "date" : {
            "type" : "date"
          },
          "name" : {
            "type" : "text",
            "fields" : {
              "keyword" : {
                "type" : "keyword",
                "ignore_above" : 256
              }
            }
          },
          "tweet" : {
            "type" : "text",
            "fields" : {
              "keyword" : {
                "type" : "keyword",
                "ignore_above" : 256
              }
            }
          },
          "user_id" : {
            "type" : "long"
          }
        }
      }
    }
  }
}
'
