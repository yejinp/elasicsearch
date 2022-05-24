curl -H "Content-Type: application/json" -XPUT 'localhost:9220/_cluster/settings?pretty' -d '
{
	"persistent" : {
	 	"discovery.zen.minimum_master_nodes" : 2
	}
}

'
