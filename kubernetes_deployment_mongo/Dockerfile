FROM mongo:5
COPY ./mongo-replica-start.sh /docker-entrypoint-initdb.d
ENTRYPOINT ["docker-entrypoint.sh"]
EXPOSE 27017
CMD ["mongod"]