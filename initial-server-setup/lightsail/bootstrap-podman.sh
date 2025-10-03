#!/usr/bin/env bash

set -eux
export DEBIAN_FRONTEND=noninteractive

apt-get -yq update
apt-get -yq install --no-install-recommends \
  ca-certificates \
  curl \
  uidmap \
  slirp4netns \
  fuse-overlayfs \
  podman

# Disable password auth. No need to install fail2ban
echo "PasswordAuthentication no" | tee -a /etc/ssh/sshd_config
echo "PermitRootLogin no" | tee -a /etc/ssh/sshd_config

echo "The Launch Script finished"
