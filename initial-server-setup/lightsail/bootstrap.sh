#!/usr/bin/env bash

set -eux
export DEBIAN_FRONTEND=noninteractive

apt-get -yq update
apt-get -yq install --no-install-recommends fail2ban ca-certificates curl gnupg lsb-release

# BEGIN Docker installation
USERNAME=ubuntu
DOCKER_FOLDER_URL=https://download.docker.com/linux/ubuntu
GPG_FOLDER=/etc/apt/keyrings
GPG_KEYRING=$GPG_FOLDER/docker.gpg

install -m 0755 -d $GPG_FOLDER
curl -fsSL $DOCKER_FOLDER_URL/gpg | gpg --dearmor -o $GPG_KEYRING
chmod a+r $GPG_KEYRING

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=$GPG_KEYRING] \
  $DOCKER_FOLDER_URL $(lsb_release -cs) stable" \
  | tee /etc/apt/sources.list.d/docker.list > /dev/null

apt-get -yq update
apt-get -yq install --no-install-recommends docker-ce

usermod -aG docker $USERNAME
# END Docker installation

# BEGIN fail2ban configuration
FAIL2BAN_JAIL_URL=<PUT PUBLIC URL HERE>
FAIL2BAN_JAIL_FILEPATH=/etc/fail2ban/jail.local
curl -o $FAIL2BAN_JAIL_FILEPATH $FAIL2BAN_JAIL_URL
chmod 0644 $FAIL2BAN_JAIL_FILEPATH
systemctl restart fail2ban
# END fail2ban configuration

echo "The Launch Script finished"
