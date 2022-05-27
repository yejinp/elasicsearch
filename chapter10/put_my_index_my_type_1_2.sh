curl -H "Content-Type: application/json" -XPUT 'localhost:9020/my_index/my_type/2?pretty'  -d '
{
	"title": "This throws a StrictDynamicMappingException",
	"new_field": "Fail!"
}
'
