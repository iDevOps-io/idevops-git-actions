#!/usr/bin/env bash

mkdir couchnfs
mount nfs_server_ip:/shared_folder/ couchnfs/
cd couchnfs
mkdir couchdb-0 couchdb-1 couchdb-2