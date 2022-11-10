FROM mongo:5
RUN touch /etc/mongo_rs_start.sh
RUN echo "mongo --eval "rs.initiate({ _id: \"rs0\", version: 1, members: [{ _id: 0, host: \"mongo-0.mongo.mongo.svc.cluster.local:27017\" }, { _id: 1, host: \"mongo-1.mongo.mongo.svc.cluster.local:27017\" }, { _id: 2, host: \"mongo-2.mongo.mongo.svc.cluster.local:27017\" }]})" > /etc/mongo_rs_start.sh
RUN /etc/mongo_rs_start.sh
ENTRYPOINT ["docker-entrypoint.sh"]
EXPOSE 27017
CMD ["mongod"]