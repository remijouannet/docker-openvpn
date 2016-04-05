#!/bin/sh

cd /app/keys
[ -f server.crt ] || ./gen.sh

chmod 600 -R /app/keys

cd /app
openvpn --config server.conf
