curl -H "Content-Type: application/json" -XPUT 'localhost:9020/my_index_v2?pretty'  -d '
{
"mappings": {
"my_type": {
"properties": {
"tags": {
"type": "keyword"
}
}
}
}
}
'
