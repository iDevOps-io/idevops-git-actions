FROM mongo:4.4.12-rc1
COPY mongo-replica-start.sh .
RUN ./mongo-replica-start.sh
ENTRYPOINT ["docker-entrypoint.sh"]
EXPOSE 27017
CMD ["mongod"]