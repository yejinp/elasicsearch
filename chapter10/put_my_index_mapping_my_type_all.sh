curl -H "Content-Type: application/json" -XPUT 'localhost:9020/my_index/my_type/_mapping?pretty'  -d '
{
	"my_type": {
	"_all": { "analyzer": "whitespace" }
}
}
'
