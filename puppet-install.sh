#!/bin/bash

if [ "$EUID" -ne "0" ]; then
  echo "This script must be run as root." >&2
  exit 1
fi

puppet_version='3.2.4'
if [ ! $(which puppet) ] || [[ $(puppet -V | sed -n 's/^\([^0-9]*\)\([0-9]\.[0-9]\.[0-9]\)$/\2/p') < $puppet_version ]]
then
  bash < <(curl -s https://raw.github.com/hashicorp/puppet-bootstrap/master/ubuntu.sh)
else
  echo "[OK] Puppet is already installed..."
fi
