curl -H "Content-Type: application/json" -XGET 'localhost:9020/_search?pretty'  -d '
{
	"query": { "match_all": {}},
	"_source": [ "title", "created" ]
}
'
