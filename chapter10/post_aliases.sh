curl -H "Content-Type: application/json" -XPOST 'localhost:9020/_aliases?pretty'  -d '
{
	"actions": [
	{ "remove": { "index": "my_index_v1", "alias": "my_index" }},
		{ "add": { "index": "my_index_v2", "alias": "my_index" }}
		]
}
'
