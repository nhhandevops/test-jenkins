FROM redis:latest

COPY ./redis /build/redis-test

WORKDIR /build/redis-test
RUN ls /build/redis-test

CMD ["redis-server", "/build/redis/master.conf"]

