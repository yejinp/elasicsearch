#"Unknown key for a START_OBJECT in [match]."
curl -H "Content-Type: application/json" -XGET 'localhost:9020/_search?pretty'  -d '
{
	"query":{
	"match_all": {
}
}
}
'
