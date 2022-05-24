curl -H "Content-Type: application/json" -XPOST 'localhost:9220/my_store/_analyze?pretty' -d '
{
	"field":"productID",
	"analyzer": "standard",
	"text" : "XHDK-A-1293-#fJ3"
}
'
