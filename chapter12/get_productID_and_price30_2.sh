curl -H "Content-Type: application/json" -XPOST 'localhost:9220/my_store/products/_search?pretty' -d '
{
	"query" : {
	      "bool":{
	          "should":[
		  { "match" : {"productID" : "KDKE-B-9947-#kL5"}},
		  { "bool" : {
			    "must" : [
			     { "match" : {"productID" : "JODL-X-1937-#pV7"}},
			     { "match" : {"price" : 30}}
			       ]
		        }
		     }
		]
    	  }
    }
}
'
