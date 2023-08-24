#!/bin/bash
# monitor elasticSearch for errors
# 
# Author: Aaron Dhiman
# Version: 0.1
# 
# pass in email address for alert.
##################################
#echo getting elastic status
status=`curl -s -XGET localhost:9200/_cluster/allocation/explain?pretty | jq '.status'`
#echo status=$status

if [ $status = 400 ]; then
#  echo "looks good." | mail -s "ES looks good." $1
  exit 0
fi

# looks like error
echo emailing alert... 
echo "ElasticSearch cluster has an error." | mail -s "ElasticSearch cluster has an error." $1

