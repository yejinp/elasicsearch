curl -H "Content-Type: application/json" -XPUT 'localhost:9020/my_index/my_type/1?pretty'  -d '
{
	"title": "This doc adds a new field",
	"stash": { "new_field": "Success!" }
}
'
