#!/bin/bash

DOCKER_CONTAINER_NAME="centos7-test"

docker build -t centos7ansible ../

docker run -ti --privileged --name $DOCKER_CONTAINER_NAME -d -p 5000:22 centos7ansible

ansible-playbook -i inventory test.yml -vvv 

docker stop $DOCKER_CONTAINER_NAME

docker rm $DOCKER_CONTAINER_NAME