#!/bin/bash

Container=jupyter
Image=jupyter:init
Volume=/media/sf_e:/src
IP=127.0.0.1:8888:8888

case $1 in
    build)
        echo "build $Image"
        sudo docker build -t $Image ./
    ;;
    create)
        echo "create: ip[$IP] name[$Container]"
        sudo docker run -d -p $IP -v $Volume --name $Container $Image
    ;;
     start)
         echo "start $Container"
         sudo docker start $Container
     ;;
     stop)
         echo "stop $Container"
         sudo docker stop $Container
     ;;
     remove)
         echo "remove: $Container"
         sudo docker rm $Container
     ;;
     *)
         echo "usage:build|create|start|stop|remove"
     ;;
 esac
