FROM alpine:3.12

LABEL maintainer="epers@honkhost.gg"

USER root

# Install some base deps
RUN set -exu \
  && apk add --no-cache \
    openssh \
    bash \
    shadow \
    openssh-sftp-server

RUN ssh-keygen -A

COPY sshd_config /etc/ssh/sshd_config
COPY entrypoint.sh /

ENV SCP_USER=username \
  SCP_PASSWORD=password \
  UID=1000 \
  GID=1000

ENTRYPOINT ["bash", "/entrypoint.sh"]
EXPOSE 22
