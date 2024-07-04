FROM redis:latest

RUN mkdir /build/redis
COPY ./redis/master.conf /build/redis

RUN cd /build/redis

CMD ["redis-server", "./master.conf"]