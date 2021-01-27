FROM ubuntu

ARG HEKETI_CLI_SERVER
ARG HEKETI_CLI_USER
ARG HEKETI_CLI_KEY

ENV VERSION="10.2.0"
ENV OS="linux"
ENV ARCH="arm"
ENV HEKETI_URL="https://github.com/heketi/heketi/releases/download/v${VERSION}/heketi-v${VERSION}.${OS}.${ARCH}.tar.gz"

RUN apt-get update -yqq                              \
    && apt-get upgrade -yqq                          \
    && apt-get install -yqq xfsprogs                 \
        net-tools                                    \
        iproute2                                     \
        supervisor                                   \
        openssh-server                               \
        openssh-client                               \
        dnsutils sshpass                             \
        curl                                         \
        vim                                          \
        bash                                         \
    && apt-get -y clean all                          \
    && curl -SL ${HEKETI_URL} -o /tmp/heketi.tar.gz  \
    && tar xzvf /tmp/heketi.tar.gz -C /etc           \
    && rm -vf /tmp/heketi.tar.gz                     \
    && mkdir -p /var/lib/heketi                      \
    && mkdir -p /var/log/heketi                      \
    && cp /etc/heketi/heketi /usr/bin/heketi         \
    && cp /etc/heketi/heketi-cli /usr/bin/heketi-cli \
    && mkdir -p /var/run/sshd /root/.ssh /var/log/supervisor /usr/local/bin

ADD ./bin /usr/local/bin
ADD ./etc/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

ENTRYPOINT ["sh", "/usr/local/bin/run.sh"]
