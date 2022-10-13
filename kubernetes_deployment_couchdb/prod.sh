#!/usr/bin/env bash
sleep 10

curl -X PUT http://localhost:5984/_users
curl -X PUT http://localhost:5984/_replicator
curl -X PUT http://localhost:5984/_global_changes
curl -X PUT http://localhost:4369/_users
curl -X PUT http://localhost:4369/_replicator
curl -X PUT http://localhost:4369/_global_changes
curl -X PUT http://localhost:9100/_users
curl -X PUT http://localhost:9100/_replicator
curl -X PUT http://localhost:9100/_global_changes