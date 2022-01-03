#!/bin/bash

set -exu
docker build --tag docker.io/honkhost/sftp:v1.0 .
docker image push docker.io/honkhost/sftp:v1.0
