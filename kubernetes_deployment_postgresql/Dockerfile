FROM postgres:10-alpine3.16
EXPOSE 5432
ENTRYPOINT ["docker-entrypoint.sh"]
CMD rm -rf /var/lib/postgresql/data/db-files/* && postgres