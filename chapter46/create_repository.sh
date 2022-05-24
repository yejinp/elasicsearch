# the path.repo of all the nodes in the cluster must be the same
curl -H "Content-Type: application/json" -XPUT 'localhost:9200/_snapshot/bap2?pretty'  -d '
{
	"type": "fs",
	"settings": {
		"location": "/home/search/backup2"
	}
}
'
