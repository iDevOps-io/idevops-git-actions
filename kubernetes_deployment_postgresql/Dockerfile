FROM postgres
EXPOSE 5432
USER postgres
ENTRYPOINT ["docker-entrypoint.sh"]
CMD rm -rf /var/lib/postgresql/data/db-files/* && postgres