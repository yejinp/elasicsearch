curl -H "Content-Type: application/json" -XPUT 'localhost:9200/my_index/_settings?pretty'  -d '
{
	"index.search.slowlog.threshold.query.warn" : "10s",
	"index.search.slowlog.threshold.fetch.debug": "500ms",
	"index.indexing.slowlog.threshold.index.info": "5s" 
}
'
