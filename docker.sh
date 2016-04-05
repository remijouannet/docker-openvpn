#!/bin/sh

APP="openvpn";

function build_ {
    git checkout master
    git pull
    docker build -t $APP .
}

function run_ {
    docker stop $(docker ps -a | grep $APP | cut -d' ' -f1);
    docker rm $(docker ps -a | grep $APP | cut -d' ' -f1);

    docker run \
        --cap-add=NET_ADMIN \
        --device='/dev/net/tun' \
        --name $APP \
        -p 1194:1194 \
        -i -t $APP
}

function restart_ {
    docker restart $APP;
}

function logs_ {
    docker logs -f $APP;
}

function bash_ {
    docker exec -it $APP sh;
}

function stop_ {
    docker stop $APP;
}

help="build : build or rebuild the DockerFile\n
run : the container after building\n
logs : follow the container logs\n
bash : get a prompt in the container\n
stop : stop the container\n
restart : the container if is already running"
case $1 in
    "build" )
        build_ ;;
    "run" )
        run_ ;;
    "restart" )
        restart_ ;;
    "logs" )
        logs_ ;;
    "bash" )
        bash_ ;;
    "stop" )
        stop_ ;;
    *)
        echo -e $help ;;        
esac
