#!bin/bash

home=$(dirname $0)
source ${home}/es.env
[ -z ${ES_HOST} ]  && ES_HOST="localhost"
[ -z ${ES_PORT} ]  && ES_PORT="9200"

url="${ES_HOST}:${ES_PORT}/my_index?pretty"
header="Content-Type: application/json"

curl -H "${header}" -XPUT ${url} -d '
{
 "settings": {
 "analysis": {
 "analyzer": {
 "my_english": {
 "type": "english",
 "stem_exclusion": [ "organization", "organizations" ],
 "stopwords": [
 "a", "an", "and", "are", "as", "at", "be", "but", "by", "for",
 "if", "in", "into", "is", "it", "of", "on", "or", "such", "that",
 "the", "their", "then", "there", "these", "they", "this", "to",
 "was", "will", "with"
 ]
 }
 }
 }
 }
}
'
