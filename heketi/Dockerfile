FROM alpine

ARG HEKETI_CLI_SERVER
ARG HEKETI_CLI_USER
ARG HEKETI_CLI_KEY

ENV VERSION="10.2.0"
ENV OS="linux"
ENV ARCH="arm"

RUN apk --no-cache add curl

RUN curl -SL https://github.com/heketi/heketi/releases/download/v${VERSION}/heketi-v${VERSION}.${OS}.${ARCH}.tar.gz -o /tmp/heketi.tar.gz \
    && tar xzvf /tmp/heketi.tar.gz -C /etc \
    && rm -vf /tmp/heketi.tar.gz \
    && mkdir -p /var/lib/heketi \
    && mkdir -p /var/log/heketi \
    && cp /etc/heketi/heketi /usr/bin/heketi \
    && cp /etc/heketi/heketi-cli /usr/bin/heketi-cli

COPY lib/* /etc/heketi
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]