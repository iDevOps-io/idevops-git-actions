FROM mongo:5
COPY ./mongo-replica-start.sh /usr/local/bin
RUN ["docker-entrypoint.sh"]
ENTRYPOINT ["/usr/local/bin/mongo-replica-start.sh"]
EXPOSE 27017
CMD ["mongod"]