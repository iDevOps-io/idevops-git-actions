#!/usr/bin/env bash
sleep 10

curl -X PUT http://localhost:5984/_user
curl -X PUT http://localhost:5984/_replicator
curl -X PUT http://localhost:5984/_global_changes

docker build -t you/awesome-couchdb
docker run -d -p 5984:5984 you/awesome-couchdb