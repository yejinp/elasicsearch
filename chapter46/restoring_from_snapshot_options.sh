# the path.repo of all the nodes in the cluster must be the same
curl -H "Content-Type: application/json" -XPOST 'localhost:9200/_snapshot/bap2/snapshot_3/_restore?pretty' -d '
{
    "indices": "index_1",
    "rename_pattern": "index_(.+)",
    "rename_replacement": "restored_index_$1"
}

'

