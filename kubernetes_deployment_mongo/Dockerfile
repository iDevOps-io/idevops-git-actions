FROM mongo:5
COPY ./mongo-replica-start.sh /usr/local/bin
RUN mongod --replSet rs0 --bind_ip 0.0.0.0
ENTRYPOINT ["docker-entrypoint.sh"]
EXPOSE 27017
CMD ["mongod"]