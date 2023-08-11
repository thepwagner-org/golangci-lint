FROM golangci/golangci-lint:v1.54.1-alpine@sha256:927129cee3693c83a98f2990141579b01ed7e80669258153bdaaaf4ba63d54e0

RUN addgroup -g 1000 golangci && \
    adduser -D -u 1000 -G golangci golangci
COPY .golangci.yml /home/golangci/.golangci.yml

WORKDIR /home/golangci/
USER 1000:1000
ENTRYPOINT ["/usr/bin/golangci-lint","run", "-v"]
