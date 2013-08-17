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

# cp -u -v ./manifests/hieradata/common.yaml /var/lib/hiera/common.yaml
# if [ ! -f /var/lib/hiera/common.yaml ]; then
    # echo "File not found! Copying common.yaml to /var/lib/hiera/"
# fi

basedir="$( dirname $( readlink -f "${0}" ) )"

## required for the relative datadir path in hiera.yaml
cd ${basedir}/manifests

puppet apply \
    --verbose \
    --hiera_config ${basedir}/manifests/hiera.yaml \
    --modulepath ${basedir}/modules \
    ${basedir}/manifests/site.pp
