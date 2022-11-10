FROM mongo:5
COPY mongo-replica-start.sh /mongo-replica-start.sh
RUN ./mongo_rs_start.sh
ENTRYPOINT ["docker-entrypoint.sh"]
EXPOSE 27017
CMD ["mongod"]