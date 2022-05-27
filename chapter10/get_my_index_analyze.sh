curl -H "Content-Type: application/json" -XGET 'localhost:9020/my_index/_analyze?pretty'  -d '
{
	"analyzer": "my_analyzer",
	"text" : "The quick & brown fox"
}
'
