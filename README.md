# docker-openvpn

* build & run

```
./docker.sh build
./docker.sh run
```

* you can test the connection with the following command

```
sudo openvpn --remote 172.17.0.2 --comp-lzo --dev tun --auth-user-pass --ca server.crt --client 

```

