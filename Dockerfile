FROM golangci/golangci-lint:v1.64.7-alpine@sha256:6d0bd5c5f6918a481a1cb7d6fddd959657631287b9654e8a02e41290a7931b14

RUN addgroup -g 1000 golangci && \
    adduser -D -u 1000 -G golangci golangci
COPY .golangci.yml /home/golangci/.golangci.yml

WORKDIR /home/golangci/
USER 1000:1000
ENTRYPOINT ["/usr/bin/golangci-lint","run", "-v"]
