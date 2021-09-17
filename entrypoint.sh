#!/bin/bash

groupadd --gid $GID $SCP_USER
useradd --uid $UID --gid $GID -d /data -s /bin/bash $SCP_USER

echo -e "$SCP_USER:$SCP_PASSWORD" | chpasswd

echo "Created user $SCP_USER with password $SCP_PASSWORD"

exec /usr/sbin/sshd -D -e
