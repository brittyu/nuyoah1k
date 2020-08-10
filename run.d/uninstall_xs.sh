#!/bin/bash
docker ps -a|grep xs_|awk '{print $1}'|xargs docker stop|xargs docker rm

