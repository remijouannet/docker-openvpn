# docker-murmur

Murmur is the server component for Mumble

* just two commands to have a working mumbleserver

```
docker pull remijouannet/docker-murmur
docker run -d -p 55445:55445 -e BANDWITH=72000 -e PASSWORD=password54125 -e PORT=55445 remijouannet/docker-murmur
```

* and juste connect to the server

![login](https://raw.githubusercontent.com/remijouannet/docker-murmur/master/mumble_login.PNG)

