# the path.repo of all the nodes in the cluster must be the same
curl -H "Content-Type: application/json" -XPUT 'localhost:9200/_snapshot/bap2/snapshot_2?pretty'  
