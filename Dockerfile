FROM alpine:3.6
MAINTAINER Bernardo Vale <bernardosilveiravale@gmail.com>

RUN apk update && apk add \
      bash \
      curl \
      less \
      groff \
      jq \
      python \
      py-pip \
      py2-pip && \
      pip install --upgrade pip awscli s3cmd && \
      mkdir /root/.aws

COPY consul-backup /usr/bin/consul-backup
COPY backup.sh /usr/bin/backup.sh

ENTRYPOINT ["/usr/bin/backup.sh"]