FROM couchdb:3.2.2

COPY ./filedirectories.sh /usr/local/bin
RUN ["./filedirectories.sh"]

COPY ./local.ini /etc/local.ini

COPY ./prod.sh /usr/local/bin/ 

EXPOSE 5984 4369 9100

VOLUME ["/usr/src/couchdb/dev/lib"]

RUN ["./prod.sh & /opt/couchdb/bin/couchdb"]

ENTRYPOINT ["tini", "--", "/docker-entrypoint.sh"]
