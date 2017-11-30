#!/bin/bash
set -euo pipefail

#Add docker host ip to /etc/hosts file
echo $(docker inspect -f '{{.NetworkSettings.Gateway}}' $HOSTNAME) dockerhost >> /etc/hosts

exec "$@"