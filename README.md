# docker-openvpn

manual
--

* build it

```
git clone https://github.com/remijouannet/docker-openvpn.git
cd docker-openvpn/
docker build -t docker-openvpn .
```

* run it

```
docker run -d --cap-add=NET_ADMIN -e PASSWD=password123 --device='/dev/net/tun' -p 1294:1294/udp -i -t docker-openvpn
```

* get the generate certificate

```
docker exec -it name_container cat /app/keys/server.crt
```

* connect ;) (with sudo or root)

```
openvpn --remote IP.IP.IP.IP --port 1294 --proto udp --comp-lzo --dev tun --auth-user-pass --ca server.crt --client
```


with docker.sh
--

* build it

```
git clone https://github.com/remijouannet/docker-openvpn.git
./docker.sh build
```

* run it

```
./docker.sh run password123
```

* get the generate certificate

```
docker exec -it name_container cat /app/keys/server.crt
```


* connect ;) (with sudo or root)

```
openvpn --remote IP.IP.IP.IP --port 1294 --proto udp --comp-lzo --dev tun --auth-user-pass --ca server.crt --client

```

