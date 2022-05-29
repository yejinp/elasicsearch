#!bin/bash

home=$(dirname $0)
source ${home}/es.env
[ -z ${ES_HOST} ]  && ES_HOST="localhost"
[ -z ${ES_PORT} ]  && ES_PORT="9200"

url="${ES_HOST}:${ES_PORT}/website/logs/_search?pretty"
header="Content-Type: application/json"

curl -H "${header}" -XGET ${url} -d '
{
	"size": 0,
	"aggs": {
		"zones": {
			"terms": {
				"field": "zone"
			},
			"aggs": {
				"load_times": {
					"percentiles": {
						"field": "latency",
						"percents": [50, 95.0, 99.0]
					}
				},
				"load_avg": {
					"avg": {
						"field": "latency"
					}
				}
			}
		}
	}
}
'
