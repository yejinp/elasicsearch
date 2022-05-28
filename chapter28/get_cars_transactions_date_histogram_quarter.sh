#!bin/bash

home=$(dirname $0)
source ${home}/es.env
[ -z ${ES_HOST} ]  && ES_HOST="localhost"
[ -z ${ES_PORT} ]  && ES_PORT="9200"

url="${ES_HOST}:${ES_PORT}/cars/transactions/_search?pretty"
header="Content-Type: application/json"

curl -H "${header}" -XGET ${url} -d '
{
	"size": 0,
	"aggs": {
		"sales": {
			"date_histogram": {
				"field": "sold",
				"interval": "quarter",
				"format": "yyyy-MM-dd",
				"min_doc_count": 0,
				"extended_bounds": {
					"min": "2014-01-01",
					"max": "2014-12-31"
				}
			},
			"aggs": {
				"per_make_sum": {
					"terms": {
						"field": "make"
					},
					"aggs": {
						"sum_price": {
							"sum": {
								"field": "price"
							}
						}
					}
				},
				"total_sum": {
					"sum": {
						"field": "price"
					}
				}
			}
		}
	}
}
'
