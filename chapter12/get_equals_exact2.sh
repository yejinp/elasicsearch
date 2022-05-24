curl -H "Content-Type: application/json" -XPOST 'localhost:9220/my_index/my_type/_search?pretty' -d '
{
	"query" : {
		"bool": {
		 "must":[
			{"match" : {"tags" :"search"}},
			{"match" : {"tag_count" :1}}
			]
		}
	}
}
'
