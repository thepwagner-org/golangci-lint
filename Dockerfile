FROM golangci/golangci-lint:v1.63.2-alpine@sha256:e0f0c154396d6d6cf39d2e1d02be57c0dbd86d9572b5bc10f0e34dcc359bdd77

RUN addgroup -g 1000 golangci && \
    adduser -D -u 1000 -G golangci golangci
COPY .golangci.yml /home/golangci/.golangci.yml

WORKDIR /home/golangci/
USER 1000:1000
ENTRYPOINT ["/usr/bin/golangci-lint","run", "-v"]
