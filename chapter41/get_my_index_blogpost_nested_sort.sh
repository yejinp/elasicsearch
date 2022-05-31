#!bin/bash

home=$(dirname $0)
source ${home}/es.env
[ -z ${ES_HOST} ]  && ES_HOST="localhost"
[ -z ${ES_PORT} ]  && ES_PORT="9200"

url="${ES_HOST}:${ES_PORT}/_search?pretty"
header="Content-Type: application/json"

curl -H "${header}" -XGET ${url} -d '
{
	"query": {
		"nested": {
			"path": "comments",
			"query": {
				"range": {
					"comments.date": {
						"gte": "2014-10-01",
						"lt": "2014-11-01"
					}
				}
			}
		}
	},
	"sort": {
		"comments.stars": {
			"order": "asc",
			"mode": "min",
			"nested_filter": {
				"range": {
					"comments.date": {
						"gte": "2014-10-01",
						"lt": "2014-11-01"
					}
				}
			}
		}
	}
}

'
