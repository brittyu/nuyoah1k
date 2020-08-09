#!/bin/bash
docker ps -a|grep rnmp_|awk '{print $1}'|xargs docker stop|xargs docker rm

