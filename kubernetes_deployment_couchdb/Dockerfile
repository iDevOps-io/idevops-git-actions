FROM couched:2.3.1
ENTRYPOINT ["tini", "--", "/docker-entrypoint.sh"]
EXPOSE 5984 4369 9100
CMD ["/opt/couchdb/bin/couchdb"]