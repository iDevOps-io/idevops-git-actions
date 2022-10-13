FROM couchdb:2.3.1
ENTRYPOINT ["tini", "--", "/docker-entrypoint.sh"]
COPY ./prod.ini /opt/couchdb/etc/local.d/
COPY ./prod.sh /usr/local/bin/
EXPOSE 5984 4369 9100

CMD ["/usr/local/bin/prod.sh & /opt/couchdb/bin/couchdb"]