curl -H "Content-Type: application/json" -XPUT 'localhost:9200/_snapshot/bap2?pretty'  -d '
{
	"type": "fs",
	"settings": {
		"location": "/home/search/backup3"
	}
}
'
