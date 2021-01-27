FROM ubuntu

ENV LOG_LEVEL=INFO \
    GLUSTERD_OPTIONS= \
    ROOT_PASSWORD="**ChangeMe**" \
    SSH_PORT=2222 \
    SSH_USER=root \
    GLUSTER_VOLUMES=vol \
    GLUSTER_VOL_OPTS="" \
    GLUSTER_ALL_VOLS_OPTS="" \
    GLUSTER_BRICK_PATH=/gluster_volume \
    SERVICE_NAME=gluster \
    DEBUG=0
    
ADD ./bin /usr/local/bin

RUN apt-get update -yqq              \
    && apt-get upgrade -yqq          \
    && apt-get install -yqq xfsprogs \
        glusterfs-server             \
        glusterfs-client             \
        lvm2                         \
        net-tools                    \
        thin-provisioning-tools      \
        iproute2                     \
        openssh-server               \
        openssh-client               \
        dnsutils sshpass             \
        curl                         \
        vim                          \
        bash                         \
        systemd dbus systemd-cron    \
        rsyslog                      \
        python python-apt            \
        ca-certificates              \
    && apt-get -y clean all          \
    && mkdir -p /var/run/sshd /root/.ssh /var/log/supervisor /usr/local/bin
    

RUN systemctl set-default multi-user.target \
    && sed -i 's/^\(module(load="imklog")\)/#\1/' /etc/rsyslog.conf \
    && (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done) \
    && rm -f /lib/systemd/system/multi-user.target.wants/* \
    /etc/systemd/system/*.wants/*                          \
    /lib/systemd/system/local-fs.target.wants/*            \
    /lib/systemd/system/sockets.target.wants/*udev*        \
    /lib/systemd/system/sockets.target.wants/*initctl*     \
    /lib/systemd/system/basic.target.wants/*               \
    /lib/systemd/system/anaconda.target.wants/*            \
    /lib/systemd/system/plymouth*                          \
    /lib/systemd/system/systemd-update-utmp*

CMD ["/lib/systemd/systemd", "&", ";", "sh", "/usr/local/bin/run.sh"]