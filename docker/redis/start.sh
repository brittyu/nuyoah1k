#!/bin/bash

redis-server /usr/local/etc/redis/redis-6379.conf &
redis-server  /usr/local/etc/redis/redis-6378.conf &
redis-server  /usr/local/etc/redis/redis-6377.conf
