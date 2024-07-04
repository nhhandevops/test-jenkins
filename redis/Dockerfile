FROM redis:latest

COPY ./redis/master.conf /build/redis-test

WORKDIR /build/redis-test

CMD ["redis-server", "./master.conf"]