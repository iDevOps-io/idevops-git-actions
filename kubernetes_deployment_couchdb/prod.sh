#!/usr/bin/env bash
sleep 10

curl -X PUT http://localhost:5984/_user
curl -X PUT http://localhost:5984/_replicator
curl -X PUT http://localhost:5984/_global_changes
curl -X PUT $HOST/_node/couchdb@localhost/_config/admins/root -d '"super_secret"'