curl -H "Content-Type: application/json" -XPUT 'localhost:9020/my_index?pretty'  -d '
{
	"mappings": {
	"my_type": {
	"_id": {
	"path": "doc_id"
},
"properties": {
"doc_id": {
"type": "keyword"
}
}
}
}
}
'
