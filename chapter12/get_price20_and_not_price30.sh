#!bin/bash

home=$(dirname $0)
source ${home}/es.env
[ -z ${ES_HOST} ]  && ES_HOST="localhost"
[ -z ${ES_PORT} ]  && ES_PORT="9200"

url="${ES_HOST}:${ES_PORT}/my_store/products/_search?pretty"
header="Content-Type: application/json"

curl -H "${header}" -XPOST ${url} -d '
{
	"query" : {
	      "bool":{
	          "should":[
		  {"match" : {"price" : 20	}},
		  {"match" : {"productID" : "XHDK-A-1293-#fJ3"}}
		   ],
		    "must_not":{
	    		"match":{"price":30}
	    	    }
		}
	}
}
'
