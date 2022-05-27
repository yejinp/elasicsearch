# "Enabling [_all] is disabled in 6.0. As a replacement, you can use [copy_to] on mapping fields to create your own catch all field
curl -H "Content-Type: application/json" -XPUT 'localhost:9020/my_index?pretty'  -d '
{
	"mappings": {
	"_default_": {
	"_all": { "enabled": false }
},
"blog": {
"_all": { "enabled": true }
}
}
}
'
