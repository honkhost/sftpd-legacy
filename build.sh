#!/bin/bash

set -exu
docker build --tag registry.honkhost.gg/honkhost/sftp:latest-dev .
docker image push registry.honkhost.gg/honkhost/sftp:latest-dev
