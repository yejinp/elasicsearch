curl -H "Content-Type: application/json" -XGET 'localhost:9220/my_index/my_type/_search?pretty' -d '
{
	"query" : {
		"match" : {
			"title" :
		       	{
				"query": "quick brown dog",
				"minimum_should_match": "75%"
			}
		}
	}
}
'
