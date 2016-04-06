FROM alpine:3.3
MAINTAINER Rémi Jouannet remijouannet@gmail.com

WORKDIR /app

RUN apk update && apk upgrade
RUN apk add openvpn openvpn-auth-pam openssl
 
COPY . /app/

RUN adduser -s /bin/false client -D -H

RUN chown openvpn:openvpn /app 
RUN chmod 600 -R /app/keys

RUN chmod u+x /app/run.sh
RUN chmod u+x /app/adduser.sh
RUN chmod u+x /app/keys/gen.sh

EXPOSE 1294/udp

CMD ["/app/run.sh"]
