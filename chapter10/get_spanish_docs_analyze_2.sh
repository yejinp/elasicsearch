curl -H "Content-Type: application/json" -XPOST  --raw '192.168.136.237:9200/spanish_docs/_analyze?pretty'  -d '
{
	"analyzer": "es_std",
	"text" : "Is this déjà vu?"
}
'
