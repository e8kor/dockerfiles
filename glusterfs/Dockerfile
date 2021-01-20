FROM ubuntu

ENV LOG_LEVEL=INFO
ENV GLUSTERD_OPTIONS=
VOLUME /devices

RUN apt-get update -yqq \
    && apt-get upgrade -yqq \
    && apt-get install -yqq xfsprogs \
        glusterfs-server \
        glusterfs-client \
        lvm2 \ 
        thin-provisioning-tools

ENTRYPOINT ["/entrypoint.sh"]