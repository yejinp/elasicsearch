curl -H "Content-Type: application/json" -XPUT 'localhost:9020/my_index?pretty'  -d '
{
	"mappings": {
	"my_type": {
	"_all": {
	"enabled": false
}
}
}
}
'
