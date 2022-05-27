curl -H "Content-Type: application/json" -XPUT 'localhost:9020/my_index/_mapping/my_type?pretty'  -d '
{
	"properties": {
	"title": {
	"type": "text",
	"analyzer": "my_analyzer"
}
}
}
'
