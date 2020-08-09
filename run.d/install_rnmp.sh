#!/bin/bash

PARENT_DIR=`pwd`
ENV_DIR="${PARENT_DIR}/env"
DOCKER_FILE_DIR="${PARENT_DIR}/docker"

service='rnmp'
service_path="${DOCKER_FILE_DIR}/workspace_${service}.yml"

cd ${DOCKER_FILE_DIR}
cp ${ENV_DIR}/${service}.env ${DOCKER_FILE_DIR}/.env

docker-compose -f ${service_path} build
docker-compose -f ${service_path} up -d

rm ${DOCKER_FILE_DIR}/.env
