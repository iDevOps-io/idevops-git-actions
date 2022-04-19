FROM docker:latest
RUN apt-get update -y && \
    apt-get install bash -y
COPY change.sh /change.sh
ENTRYPOINT ["bash", "/change.sh"]
