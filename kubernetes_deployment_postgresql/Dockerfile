FROM postgres
EXPOSE 5432
ENTRYPOINT ["docker-entrypoint.sh"]
CMD rm -rf /var/lib/postgresql/data/db-files/* && postgres