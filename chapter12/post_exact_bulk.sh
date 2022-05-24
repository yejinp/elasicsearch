curl -H "Content-Type: application/json" -XPOST 'localhost:9220/my_index/my_type/_bulk' -d '
{ "index": { "_id": 1 }}
{ "tags" : ["search"], "tag_count" : 1 }
{ "index": { "_id": 2 }}
{ "tags" : ["search", "open_source"], "tag_count" : 2 }

'
