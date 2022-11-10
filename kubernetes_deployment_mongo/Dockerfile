FROM mongo:5
COPY mongo-replica-start.sh /
RUN chmod 777 ./mongo-replica-start.sh
RUN ./mongo_replica_start.sh
ENTRYPOINT ["docker-entrypoint.sh"]
EXPOSE 27017
CMD ["mongo"]