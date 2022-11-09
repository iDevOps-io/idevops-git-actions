#!/bin/bash

HOSTNAME="$(cat)/etc/hostname"
RUN_MONGO="$(mongo) --eval"
RUN_RS_MONGO="rs.initiate({ _id: "rs0", version: 1, members: [ { _id: 0, host: "mongo-0.mongo.mongo.svc.cluster.local:27017" }, { _id: 1, host: "mongo-1.mongo.mongo.svc.cluster.local:27017" }, { _id: 2, host: "mongo-2.mongo.mongo.svc.cluster.local:27017" } ]})"

if [[ $HOSTNAME==mongo-0  ]]; then
     echo 'mongo-0 is running'
 elif [[ $HOSTNAME==mongo-1 ]]; then
     echo 'mongo-1 is running'
 else
     $RUN_MONGO $RUN_RS_MONGO 
 fi