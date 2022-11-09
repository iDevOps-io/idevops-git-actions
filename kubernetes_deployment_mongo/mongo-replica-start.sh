#!/bin/bash

#SERVICE_PATH=$(cat /etc/hosts | grep -i $HOSTNAME | awk '{print $2}')
HOSTNAME=$(cat /etc/hostname)
RS_MONGO_INITIATE=$(mongo --eval "rs.initiate({ _id: \"rs0\", version: 1, members: [{ _id: 0, host: \"mongo-0.mongo.mongo.svc.cluster.local:27017\" }, { _id: 1, host: \"mongo-1.mongo.mongo.svc.cluster.local:27017\" }, { _id: 2, host: \"mongo-2.mongo.mongo.svc.cluster.local:27017\" }]})")
TEST_COMMAND=$(touch /etc/sampletext/text.txt)

sleep '5m' && echo $RS_MONGO_INITIATE