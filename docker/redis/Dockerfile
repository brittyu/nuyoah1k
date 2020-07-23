ARG REDIS_VERSION
FROM redis:${REDIS_VERSION}

RUN mkdir -p /usr/local/etc/redis
COPY redis.conf /usr/local/etc/redis/redis.conf

VOLUME /data

CMD ["redis-server", "/usr/local/etc/redis/redis.conf"]

EXPOSE 6379
