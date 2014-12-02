docker-elk
=============

Run Kibana, ElasticSearch, Logstash, and Ngnix in Docker.

## Docker 

### Build your image
docker build --tag elk-demo ./docker/

### Run it
docker run --name elk-demo-test1 --rm -p 80:80 -p 9200:9200 -p 49021:49021 -p 49022:49022 -p 122:22 -p 9999:9999/udp -v /tmp/logs:/logs -v $PWD/docker:/shared elk-demo

### To get a bash
docker exec -ti elk-demo-test1 bash

## Write some logs
./generateLogs.sh

## Kibana
10 Minute Walk Through http://www.elasticsearch.org/guide/en/kibana/current/working-with-queries-and-filters.html
Dashboard http://localhost/#/dashboard/file/custom_dashboard.json
Home page http://localhost/#/dashboard/file/default.json

## Elasticsearch
Admin page http://localhost:9200/_plugin/head/
To delete data:
curl -XDELETE 'http://localhost:9200/STORE/'
curl -XDELETE 'http://localhost:9200/_all/'

## Logstash
To start it: 
docker exec -ti elk-demo-test1 bash
/logstash/bin/logstash -v -f /shared/logstash.conf

