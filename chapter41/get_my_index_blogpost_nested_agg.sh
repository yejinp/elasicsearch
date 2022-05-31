#!bin/bash

home=$(dirname $0)
source ${home}/es.env
[ -z ${ES_HOST} ]  && ES_HOST="localhost"
[ -z ${ES_PORT} ]  && ES_PORT="9200"

url="${ES_HOST}:${ES_PORT}/_search?pretty"
header="Content-Type: application/json"

curl -H "${header}" -XGET ${url} -d '
{
	"size":0,
	"aggs": {
		"comments": {
			"nested": {
				"path": "comments"
			},
			"aggs": {
				"by_month": {
					"date_histogram": {
						"field": "comments.date",
						"interval": "month",
						"format": "yyyy-MM"
					},
					"aggs": {
						"avg_stars": {
							"avg": {
								"field": "comments.stars"
							}
						}
					}
				}
			}
		}
	}
}

'
