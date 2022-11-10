FROM mongo:5
COPY ./mongo-replica-start.sh /usr/local/bin
ENTRYPOINT ["docker-entrypoint.sh"]
EXPOSE 27017
CMD ["/usr/local/bin/mongo-replica-start.sh"]