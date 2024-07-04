FROM redis:latest

COPY ./redis/master.conf /build/redis-test

RUN cd /build/redis-test

CMD ["redis-server", "./master.conf"]