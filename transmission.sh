#!/bin/bash
CONFIG="/config"

if [[ ! -f $CONFIG/settings.json ]]; then
  cp /opt/settings.json $CONFIG/
  if [[ -z $ADMIN_PASS ]]; then
    echo Please provide a password for 'transmission' user via the ADMIN_PASS enviroment variable.
    exit 1
  else
    sed -i -e  "s/@password@/$ADMIN_PASS/" $CONFIG/settings.json
  fi
fi
/usr/bin/transmission-daemon -f --config-dir /config --log-info
