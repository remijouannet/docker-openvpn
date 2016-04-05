openssl dhparam -out dh.pem 2048

openssl req \
    -config openssl.conf \
    -x509 \
    -nodes \
    -newkey rsa:4096 \
    -days 365 \
    -out server.crt \
    -keyout server.key
