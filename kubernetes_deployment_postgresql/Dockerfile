FROM postgres
EXPOSE 5432
USER postgres
RUN mkdir -p "$PGDATA" && chown -R postgres:postgres "$PGDATA" && chmod 777 "$PGDATA"
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["postgres"]