curl -H "Content-Type: application/json" -XPUT 'localhost:9200/_cluster/settings?pretty'  -d '
{
"persistent" : {
 "discovery.zen.minimum_master_nodes" : 3
  },
 "transient" : {
  "indices.store.throttle.max_bytes_per_sec" : "10mb"
   }
}
'
