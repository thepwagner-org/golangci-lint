FROM golangci/golangci-lint:v1.59.0-alpine@sha256:18984e6024cdbceb328b75c928b804c399e7888f7d2d9d84232b597b221b1104

RUN addgroup -g 1000 golangci && \
    adduser -D -u 1000 -G golangci golangci
COPY .golangci.yml /home/golangci/.golangci.yml

WORKDIR /home/golangci/
USER 1000:1000
ENTRYPOINT ["/usr/bin/golangci-lint","run", "-v"]
