ARG REDIS_VERSION
FROM redis:${REDIS_VERSION}

RUN mkdir -p /usr/local/etc/redis
COPY ./etc/redis-6379.conf /usr/local/etc/redis/redis-6379.conf
COPY ./etc/redis-6378.conf /usr/local/etc/redis/redis-6378.conf
COPY ./etc/redis-6377.conf /usr/local/etc/redis/redis-6377.conf

VOLUME /data

ADD start.sh /root
#CMD chmod +x /root/start.sh

#CMD ["redis-server", "/usr/local/etc/redis/redis.conf"]
ENTRYPOINT ["sh", "/root/start.sh"]

EXPOSE 6379
EXPOSE 6378
EXPOSE 6377
