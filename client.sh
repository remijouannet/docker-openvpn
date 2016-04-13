#!/bin/sh

[ -f client.ovpn ] || cat >client.ovpn <<EOF
remote $1 1294 udp
client
nobind
dev tun
auth-user-pass
comp-lzo


<key>
`cat keys/client.key`
</key>
<cert>
`cat keys/client.crt`
</cert>
<ca>
`cat keys/ca.crt`
</ca>
<dh>
`cat keys/dh.pem`
</dh>
EOF
