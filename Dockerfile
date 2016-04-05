FROM alpine:3.3
MAINTAINER Rémi Jouannet remijouannet@gmail.com

ENV PASSWD password123

WORKDIR /app

RUN apk update && apk upgrade
RUN apk add openvpn openvpn-auth-pam openssl
 
COPY . /app/

RUN adduser -s /bin/false client -D -H
RUN echo client:$PASSWD | chpasswd

RUN chown openvpn:openvpn /app 
RUN chmod 600 -R /app/keys

RUN chmod u+x /app/run.sh
RUN chmod u+x /app/keys/gen.sh

CMD ["/app/run.sh"]
