curl -H "Content-Type: application/json" -XPUT 'localhost:9200/_cluster/settings?pretty'  -d '
{
	"transient" : {
		"cluster.routing.allocation.enable" : "none"
	}
}
'
