curl -H "Content-Type: application/json" -XGET 'localhost:9220/my_index/my_type/_search?pretty' -d '
{
	"query" : {
		"match" : {
			"title" : "BROWN DOG"
		}
	}
}
'
