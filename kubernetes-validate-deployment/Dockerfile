FROM ubuntu:22.10
RUN apk update && \
    apk add bash
COPY change.sh /change.sh
ENTRYPOINT ["bash", "/change.sh"]