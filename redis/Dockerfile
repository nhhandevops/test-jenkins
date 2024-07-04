FROM redis:latest

COPY ./redis /build/redis-test

WORKDIR /build/redis-test

CMD ["redis-server", "./master.conf"]