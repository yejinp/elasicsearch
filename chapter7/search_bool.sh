curl -H 'Content-Type: application/json' -XGET 'http://localhost:9200/_search?pretty' -d '
{
	"query":{
		"bool":{
			"must": {"tweet": "elasticsearch"},
			"must_not": {"name": "mary"},
			"should": {"match": {"tweet": "full text"}}
		}
	}
}
'
