FROM couchdb:3.2.2
RUN sudo apt update && sudo apt install -y curl apt-transport-https gnupg curl https://couchdb.apache.org/repo/keys.asc | gpg --dearmor | sudo tee /usr/share/keyrings/couchdb-archive-keyring.gpg >/dev/null 2>&1 source /etc/os-release echo "deb [signed-by=/usr/share/keyrings/couchdb-archive-keyring.gpg] https://apache.jfrog.io/artifactory/couchdb-deb/ ${VERSION_CODENAME} main" | sudo tee /etc/apt/sources.list.d/couchdb.list >/dev/null
COPY ./prod.ini /etc/local.ini
COPY ./prod.sh /usr/local/bin/ 
EXPOSE 5984 4369 9100
RUN ["./prod.sh & /opt/couchdb/bin/couchdb"]
ENTRYPOINT ["tini", "--", "/docker-entrypoint.sh"]
