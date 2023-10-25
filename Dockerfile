FROM golangci/golangci-lint:v1.55.1-alpine@sha256:be89157ba90e80348e7551e8d17d2dc90f01dcdf33055a3e3ca85416137668b1

RUN addgroup -g 1000 golangci && \
    adduser -D -u 1000 -G golangci golangci
COPY .golangci.yml /home/golangci/.golangci.yml

WORKDIR /home/golangci/
USER 1000:1000
ENTRYPOINT ["/usr/bin/golangci-lint","run", "-v"]
