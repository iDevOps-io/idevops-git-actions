FROM couchdb:3.2.2

RUN mkdir couchnfs
RUN mount nfs_server_ip:/shared_folder/ couchnfs/
RUN cd couchnfs

RUN mkdir couchdb-0 couchdb-1 couchdb-2
RUN --name my-mycouchdb -v /home/couchdb/etc:/opt/couchdb/local.d -d couchdb

COPY local.ini /opt/chouch/etc
COPY ./prod.sh /usr/local/bin/ 

EXPOSE 5984 4369 9100

VOLUME ["/usr/src/couchdb/dev/lib"]

RUN ["./prod.sh & /opt/couchdb/bin/couchdb"]

ENTRYPOINT ["tini", "--", "/docker-entrypoint.sh"]
