FROM mongo:5
COPY ./mongo-replica-start.sh /etc/
ENTRYPOINT ["docker-entrypoint.sh"]
EXPOSE 27017
CMD ["mongod"]