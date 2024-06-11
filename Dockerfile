FROM golangci/golangci-lint:v1.59.1-alpine@sha256:2a5293b5d25319a515db44f00c7e72466a78488106fbb995730580ef25fb8b20

RUN addgroup -g 1000 golangci && \
    adduser -D -u 1000 -G golangci golangci
COPY .golangci.yml /home/golangci/.golangci.yml

WORKDIR /home/golangci/
USER 1000:1000
ENTRYPOINT ["/usr/bin/golangci-lint","run", "-v"]
