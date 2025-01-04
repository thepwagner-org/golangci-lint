FROM golangci/golangci-lint:v1.63.4-alpine@sha256:e1768ec667a10f7712d38abc484d18660d8c32caf3a252b8531ea77ff09de575

RUN addgroup -g 1000 golangci && \
    adduser -D -u 1000 -G golangci golangci
COPY .golangci.yml /home/golangci/.golangci.yml

WORKDIR /home/golangci/
USER 1000:1000
ENTRYPOINT ["/usr/bin/golangci-lint","run", "-v"]
