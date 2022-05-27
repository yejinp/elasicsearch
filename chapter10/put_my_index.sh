curl -H "Content-Type: application/json" -XPUT 'localhost:9020/my_index?pretty'  -d '
{
	"settings": {
	"analysis": {
	"char_filter": {
	"&_to_and": {
	"type": "mapping",
	"mappings": [ "&=> and "]
}},
"filter": {
"my_stopwords": {
"type": "stop",
"stopwords": [ "the", "a" ]
}},
"analyzer": {
"my_analyzer": {
"type": "custom",
"char_filter": [ "html_strip", "&_to_and" ],
"tokenizer": "standard",
"filter": [ "lowercase", "my_stopwords" ]
}}
}}
}
'
