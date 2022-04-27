FROM amazon/aws-cli:2.6.0
RUN apk update && \
    apk add bash
COPY change.sh /change.sh
ENTRYPOINT ["bash", "/change.sh"]