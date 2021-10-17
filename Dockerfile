FROM alpine:3.12

LABEL maintainer="pers.edwin@gmail.com"

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

ENV SCP_USER=XN6y9wpUQ4DnJ7 \
  SCP_PASSWORD=7JQCwKLWmqvMeHZr3yVb92djaxPWsq \
  UID=1000 \
  GID=1000

ENTRYPOINT ["bash", "/entrypoint.sh"]
EXPOSE 22
