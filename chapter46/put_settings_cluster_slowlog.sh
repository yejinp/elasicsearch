curl -H "Content-Type: application/json" -XPUT 'localhost:9200/_cluster/settings?pretty'  -d '
{
	"transient" : {
		"logger.index.search.slowlog" : "DEBUG",
		"logger.index.indexing.slowlog" : "WARN"
	}
}
'
