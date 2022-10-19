FROM couchdb:3.2.2
ENTRYPOINT ["tini", "--", "/docker-entrypoint.sh"]
COPY ./prod.ini /opt/couchdb/etc/local.d/
COPY ./prod.sh /usr/local/bin/
EXPOSE 5984 4369 9100
RUN ["/usr/local/bin/prod.sh & /opt/couchdb/bin/couchdb"]