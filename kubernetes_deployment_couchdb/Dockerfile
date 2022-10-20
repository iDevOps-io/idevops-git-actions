FROM couchdb:3.2.2
COPY ./prod.ini /etc/default.ini
COPY ./prod.sh /usr/local/bin/ 
EXPOSE 5984 4369 9100
RUN ["./prod.sh & /opt/couchdb/bin/couchdb"]
ENTRYPOINT ["tini", "--", "/docker-entrypoint.sh"]
