curl -H "Content-Type: application/json" -XGET 'localhost:9220/my_index/my_type/_search?pretty' -d '
{
	"query": {
		"bool": {
			"must": { "match": { "title": "quick" }},
			"must_not": { "match": { "title": "lazy" }},
			"should": [
				{ "match": { "title": "brown" }},
				{ "match": { "title": "dog" }}
			]
		}
	}
}
'
