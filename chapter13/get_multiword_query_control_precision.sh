curl -H "Content-Type: application/json" -XGET 'localhost:9220/my_index/my_type/_search?pretty' -d '
{
	"query" : {
		"bool": {
			"should": [
				{ "match": { "title": "brown" }},
				{ "match": { "title": "fox" }},
				{ "match": { "title": "dog" }}
			     ],
			     "minimum_should_match": 2
	       }

	}
}
'
