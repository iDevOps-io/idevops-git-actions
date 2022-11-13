#!/bin/bash

HOSTNAME=$(cat /etc/hostname)

if [ $HOSTNAME == mongo-0 ]
then
  sleep '5m' && mongo --eval 'rs.initiate(
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
  echo "the script is running" >> /etc/test.txt
else
  echo "the script is running" >> /etc/test.txt
fi
