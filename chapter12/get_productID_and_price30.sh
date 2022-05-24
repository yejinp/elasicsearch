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
		  { "term" : {"productID" : "KDKE-B-9947-#kL5"}},
		  { "bool" : {
			    "must" : [
			     { "term" : {"productID" : "JODL-X-1937-#pV7"}},
			     { "term" : {"price" : 30}}
			       ]
		        }
		     }
		]
    	  }
    }
}
'
