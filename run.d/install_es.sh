#!/bin/bash

PARENT_DIR=`pwd`
ENV_DIR="${PARENT_DIR}/env"
DOCKER_FILE_DIR="${PARENT_DIR}/docker"

service='es'
service_path="${DOCKER_FILE_DIR}/workspace_${service}.yml"

cd ${DOCKER_FILE_DIR}
cp ${ENV_DIR}/${service}.env ${DOCKER_FILE_DIR}/.env

contrainer_count=`docker ps -a | grep ${service}_ | wc -l`
if [[ ${contrainer_count} -eq 0 ]]; then
    docker-compose -f ${service_path} build
fi

docker-compose -p ${service} -f ${service_path} up -d

rm ${DOCKER_FILE_DIR}/.env
