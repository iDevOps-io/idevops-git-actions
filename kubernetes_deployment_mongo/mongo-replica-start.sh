#!/bin/bash

HOSTNAME="$(cat)/etc/hostname"
#SERVICE_PATH=$(cat /etc/hosts | grep -i $HOSTNAME | awk '{print $2}')
RS_MONGO_INITIATE=$(mongo --eval "rs.initiate(
   {
      _id: \"rs0\",
      version: 1,
      members: [
         { _id: 0, host : \"mongo-0.mongo.mongo.svc.cluster.local:27017\" },
         { _id: 1, host : \"mongo-1.mongo.mongo.svc.cluster.local:27017\" },
         { _id: 2, host : \"mongo-2.mongo.mongo.svc.cluster.local:27017\" }
      ]
   })")

if [[ $HOSTNAME==mongo-1  ]]; then
     echo 'mongo-1 is running'
 elif [[ $HOSTNAME==mongo-2 ]]; then
     echo 'mongo-2 is running'
 else
     sleep '5m' && $RS_MONGO_INITIATE
 fi