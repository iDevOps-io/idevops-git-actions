#!/bin/bash

HOSTNAME=$(cat /etc/hostname)
HOSTNAME_NO_NUMBER=$(cat /etc/hostname | awk -F"[-]+" '/-/{print $1}')
CLUSTER_SERVICE_ADDRESS=$(cat /etc/hosts | grep $HOSTNAME | awk '{print $2}' | cut -f2- -d.)

if [ $HOSTNAME == $HOSTNAME_NO_NUMBER-0 ]
then
  echo $HOSTNAME || sleep '5m' && mongo --eval 'rs.initiate(
     {
        _id: "rs0",
        version: 1,
        members: [
           { _id: 0, host : "'$HOSTNAME_NO_NUMBER'-0.'$CLUSTER_SERVICE_ADDRESS':27017" },
           { _id: 1, host : "'$HOSTNAME_NO_NUMBER'-1.'$CLUSTER_SERVICE_ADDRESS':27017" },
           { _id: 2, host : "'$HOSTNAME_NO_NUMBER'-2.'$CLUSTER_SERVICE_ADDRESS':27017" }
        ]
     }
  )'
elif [ $HOSTNAME == $HOSTNAME_NO_NUMBER-1 ]
then
  echo "the script is running" >> /etc/test.txt
else
  echo "the script is running" >> /etc/test.txt
fi
