#!/bin/sh

show_help() {
    echo "Usage:	$0 COMMAND"
    echo "Commands:"
    echo ""
    curr=$PWD;
    cd `dirname $0`/run.d;
    ls *_*.sh|awk -F '_' '{print $1,$2;}'|xargs -I {} basename {} .sh;
    cd $curr;
}

check_docker() {
    docker -v
    if [[ $? -ne 0 ]]; then
        echo "需要先安装并启动 docker: "
        echo "https://docs.docker.com/docker-for-mac/install/"
        echo "https://docs.docker.com/install/linux/docker-ce/centos/"
        exit 1
    fi
}

check_docker_compose() {
    check_docker
    docker-compose -v
    if [[ $? -ne 0 ]]; then
        echo "需要先安装 docker compose: "
        echo "$ curl -sSL https://get.docker.com/ | sh"
        echo "$ sudo pip install docker-compose"
        exit 1
    fi
}

init_network() {
    is_exist=`docker network ls | grep backend | wc -l`
    if [[ $is_exist -eq 0 ]]; then
        docker network create backend
    fi
}

begin_service() {
    check_docker_compose

    init_network

    root=`dirname $0`
    shell_path=${root}/run.d/${1}_${2}.sh
    shift 2
    ${shell_path} $@
}

if [[ -z "$1" ]]; then
    show_help;
    exit;
fi

case $1 in
    '-h' | '--help' | 'help' | 'list')
        show_help
        ;;

    * )
        if [[ -z "${2}" ]]; then
            show_help
            exit;
        fi

        begin_service $@
esac
