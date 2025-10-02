#!/usr/bin/env bash

set -ux

EXT_DEVICE=/dev/nvme1n1
MOUNT_PATH=/mnt/lightsail-ext-disk
USERNAME=ubuntu
GROUP=ubuntu

if grep -q "^${EXT_DEVICE}" /etc/fstab; then
  echo "The /etc/fstab file contains the necessary mount information, and the disk should already be mounted. Stop execution"
else
  sudo mkfs -t xfs $EXT_DEVICE

  sudo mkdir $MOUNT_PATH

  sudo chown $USERNAME:$GROUP $MOUNT_PATH

  sudo cp /etc/fstab /etc/fstab.orig

  echo "$EXT_DEVICE $MOUNT_PATH xfs defaults,nofail 0 2" | sudo tee -a /etc/fstab

  sudo reboot
fi

echo "DONE"
