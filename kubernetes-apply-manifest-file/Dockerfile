FROM python:latest
COPY change.sh /change.sh
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
    curl -o aws-iam-authenticator https://s3.us-west-2.amazonaws.com/amazon-eks/1.21.2/2021-07-05/bin/darwin/amd64/aws-iam-authenticator && \
    pip install awscli && \
    cp kubectl /usr/bin/kubectl && \
    cp aws-iam-authenticator /usr/bin/aws-iam-authenticator && \
    chmod a+xX /usr/bin/aws-iam-authenticator && \
    chmod a+xX /usr/bin/kubectl
ENTRYPOINT ["bash", "/change.sh"]
