curl -H "Content-Type: application/json" -XPUT 'localhost:9200/_cluster/settings?pretty'  -d '
{
	"transient" : {
		"indices.store.throttle.max_bytes_per_sec" : "50mb"
	}
}
'
