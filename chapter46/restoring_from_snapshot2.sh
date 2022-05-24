# the path.repo of all the nodes in the cluster must be the same
curl -H "Content-Type: application/json" -XPOST 'localhost:9200/_snapshot/bap2/snapshot_2/_restore?pretty'  
