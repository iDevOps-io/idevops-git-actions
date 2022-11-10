FROM mongo:5
COPY ./mongo-replica-start.sh /etc/
RUN ["./mongo_replica_start.sh"]
ENTRYPOINT ["docker-entrypoint.sh"]
EXPOSE 27017
CMD ["mongod"]