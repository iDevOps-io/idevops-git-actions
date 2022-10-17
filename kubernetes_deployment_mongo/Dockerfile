FROM mongo:4.4.12-rc1
ENTRYPOINT ["docker-entrypoint.sh"]
EXPOSE 27017
HEALTHCHECK CMD echo "rs.initiate({_id:'rs0',members:[{_id:0,host:\"mongo-0.mongo.mongo.svc.cluster.local:27017\"},{_id:1,host:\"mongo-1.mongo.mongo.svc.cluster.local:27017\"},{_id:2,host:\"mongo-2.mongo.mongo.svc.cluster.local:27017\"}]}).ok || rs.status().ok" | mongo --port 27017 --quiet
CMD ["mongod"]