#!/bin/bash


touch "/etc/testing_script_text.txt" &&
echo "this is test text" >> "/etc/testing_script_text.txt" &&
sleep '1m' &&
echo "this is text inserted 1 minute later" >> "/etc/testing_script_text.txt" &&
mongod --replSet rs0 &&
sleep '5m' &&
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