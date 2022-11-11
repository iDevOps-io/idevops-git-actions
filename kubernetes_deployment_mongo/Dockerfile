FROM mongo:5
COPY ./mongo-replica-start.sh /usr/local/bin
RUN chmod 755 /usr/local/bin/mongo-replica-start.sh
ENTRYPOINT ["docker-entrypoint.sh"]
EXPOSE 27017
CMD ["mongod"]