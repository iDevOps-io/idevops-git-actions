FROM couchdb:2.3.1
ENTRYPOINT ["tini", "--", "/docker-entrypoint.sh"]
RUN mkdir couchnfs
RUN mount nfs_server_ip:/shared_folder/ couchnfs/
RUN cd couchnfs
RUN mkdir couchdb-0 couchdb-1 couchdb-2
RUN curl -X PUT http://localhost:5984/_users
RUN curl -X PUT http://localhost:5984/_replicator
RUN curl -X PUT http://localhost:5984/_global_changes
COPY ./prod.ini /opt/couchdb/etc/local.d/
COPY ./prod.sh /usr/local/bin/
EXPOSE 5984 4369 9100
RUN ["/usr/local/bin/prod.sh & /opt/couchdb/bin/couchdb"]