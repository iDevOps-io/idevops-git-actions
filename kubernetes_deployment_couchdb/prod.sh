#!/usr/bin/env bash
sleep 240

curl -X PUT http://localhost:5984/_user
curl -X PUT http://localhost:5984/_replicator
curl -X PUT http://localhost:5984/_global_changes
