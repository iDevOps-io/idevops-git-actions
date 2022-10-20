FROM couchdb:3.2.2
RUN set -ex; \
    curl -s https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add -; \
    echo 'deb https://deb.nodesource.com/node_10.x buster main' > /etc/apt/sources.list.d/nodesource.list; \
    echo 'deb-src https://deb.nodesource.com/node_10.x buster main' >> /etc/apt/sources.list.d/nodesource.list; \
    apt-get update -y && apt-get install -y nodejs; \
    npm install -g grunt-cli
COPY ./prod.ini /etc/local.ini
COPY ./prod.sh /usr/local/bin/ 
EXPOSE 5984 4369 9100
VOLUME ["/usr/src/couchdb/dev/lib"]
RUN ["./prod.sh & /opt/couchdb/bin/couchdb"]
ENTRYPOINT ["tini", "--", "/docker-entrypoint.sh"]
