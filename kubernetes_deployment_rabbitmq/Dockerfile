FROM rabbitmq:latest
EXPOSE 5672
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["rabbitmq-server"]
RUN rabbitmq-plugins enable rabbitmq_management