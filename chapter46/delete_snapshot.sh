# the path.repo of all the nodes in the cluster must be the same
curl -H "Content-Type: application/json" -XDELETE 'localhost:9200/_snapshot/bap2/snapshot_1?pretty'  
