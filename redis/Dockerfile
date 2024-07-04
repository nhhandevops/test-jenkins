FROM redis:latest

COPY ./redis /build/redis-test

WORKDIR /build/redis-test

RUN sudo sysctl -w vm.overcommit_memory=1
RUN sudo sysctl -w net.core.somaxconn=65535
CMD ["redis-server", "./master.conf"]
