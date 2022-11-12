#!/bin/bash

HOSTNAME=$(cat /etc/hostname)


if [ $HOSTNAME == mongo-0 ]
then
  mongod --replSet rs0 --bind_ip 0.0.0.0 || sleep '5m' && mongo 'rs.initiate(
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
elif [ $HOSTNAME == mongo-1 ]
then
  mongod --replSet rs0 --bind_ip 0.0.0.0
else
  mongod --replSet rs0 --bind_ip 0.0.0.0
fi