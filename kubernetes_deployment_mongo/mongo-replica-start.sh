#!/bin/bash

HOSTNAME=$(cat /etc/hostname)
STARTMONGODB=$(mongod --replSet rs0 --bind_ip 0.0.0.0)
SLEEPSHORT=$(sleep '2m')

echo $STARTMONGODB

if [ $HOSTNAME == mongo-2 ]
then
  echo $SLEEPSHORT && mongo --eval 'rs.initiate(
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
elif [ $HOSTNAME == mongo-0 ]
then
  touch /etc/test.txt && echo "pod one is running the script" >> /etc/test.txt
else
  echo "starting next pod"
fi