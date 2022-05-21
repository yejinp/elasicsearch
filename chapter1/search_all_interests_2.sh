curl -H "Content-Type: application/json" -XGET 'localhost:9200/megacorp/employee/_search?pretty'  -d '
{
	"aggs": {
		"all_interests": {
			"terms": { "field": "interests" },
            "aggs" : {
             "avg_age" : {
              "avg" : { "field" : "age" }
               }
            }
     		}
	}
}
'
