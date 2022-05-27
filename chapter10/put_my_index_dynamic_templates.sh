curl -H "Content-Type: application/json" -XPUT 'localhost:9020/my_index?pretty'  -d '
{
"mappings": {
"my_type": {
"dynamic_templates": [
{ "es": {
	"match": "*_es",
	"match_mapping_type": "string",
	"mapping": {
	"type": "text",
	"analyzer": "spanish"
}
}},
{ "en": {
	"match": "*",
	"match_mapping_type": "string",
	"mapping": {
	"type": "text",
	"analyzer": "english"
}
}}
]
}}
}
'
