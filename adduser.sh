#!bin/sh

adduser -s /bin/false $1 -D -H
echo $1:$2 | chpasswd

