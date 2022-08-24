FROM golangci/golangci-lint:v1.49.0-alpine@sha256:6ee4d0f07a27602408dbe5e2205bf6e80e9e28d7bc84960ff8e8ee5c410cbeb1

RUN addgroup -g 1000 golangci && \
    adduser -D -u 1000 -G golangci golangci
COPY .golangci.yml /home/golangci/.golangci.yml

WORKDIR /home/golangci/
USER 1000:1000
ENTRYPOINT ["/usr/bin/golangci-lint","run", "-v"]
