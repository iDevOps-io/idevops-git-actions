#!/bin/bash

HOSTNAME=$(cat /etc/hostname)

if [ $HOSTNAME == mongo-2 ]
then
  mongo --eval 'rs.initiate(
     {
        _id: "rs0",
        version: 1,
        members: [
           { _id: 0, host : "mongo-0.mongo.mongo.svc.cluster.local:27017" },
           { _id: 1, host : "mongo-1.mongo.mongo.svc.cluster.local:27017" },
           { _id: 2, host : "mongo-2.mongo.mongo.svc.cluster.local:27017" }
        ]
     }
  )'
fi
