#!/bin/sh

cd /app/keys
[ -f server.crt ] || ./gen.sh

chmod 600 -R /app/keys

[ -n "$PASSWD" ] && echo client:$PASSWD | chpasswd

iptables -t nat -A POSTROUTING -s 10.10.0.0/24 -o eth0 -j MASQUERADE

cd /app
openvpn --config server.conf
