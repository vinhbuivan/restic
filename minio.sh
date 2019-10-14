#!/bin/bash
DOCKERCOMPOSE=/usr/local/bin/docker-compose
start(){
    echo "Starting MinIO server"
    $DOCKERCOMPOSE up -d
    echo "MinIO server is started"
    exit 0
}

stop(){
    echo "Stopping MinIO server"
    $DOCKERCOMPOSE down
    echo "MinIO server is stopped"
    exit 0
}

status(){
    $DOCKERCOMPOSE logs
    $DOCKERCOMPOSE ps
}

restart(){
   stop
   sleep 3
   start
   sleep 1
   status
   exit 0
}


case "$1" in
    start)
        start
        ;;
    stop)
        stop
        ;;
    status)
        status
        ;;
    restart)
        restart
        ;;

    *)
    echo $"Usage: $0 {start|stop|restart|status}"
    exit 1
esac


