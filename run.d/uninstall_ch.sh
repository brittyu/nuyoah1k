#!/bin/bash
docker ps -a|grep es_|awk '{print $1}'|xargs docker stop|xargs docker rm

