curl -H "Content-Type: application/json" -XPUT 'localhost:9220/my_index?pretty' -d '
{ "settings": { "number_of_shards": 1 }}

'
