curl -H "Content-Type: application/json" -XPUT 'localhost:9020/my_index/my_type/_mapping?pretty'  -d '
{
	"my_type": {
	"include_in_all": false,
	"properties": {
	"title": {
	"type": "string",
	"include_in_all": true
},
}
}
}
'
