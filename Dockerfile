FROM golangci/golangci-lint:v1.51.1-alpine@sha256:3eb5f75cf386e85f3ff68513fd1a0fc97977291e346b937f396ab633403914a2

RUN addgroup -g 1000 golangci && \
    adduser -D -u 1000 -G golangci golangci
COPY .golangci.yml /home/golangci/.golangci.yml

WORKDIR /home/golangci/
USER 1000:1000
ENTRYPOINT ["/usr/bin/golangci-lint","run", "-v"]
