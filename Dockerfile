FROM golangci/golangci-lint:v1.55.2-alpine@sha256:22e4dd2bba6ad3c6ef918432b92329b51e82d55e470d268d315bfff6a160bceb

RUN addgroup -g 1000 golangci && \
    adduser -D -u 1000 -G golangci golangci
COPY .golangci.yml /home/golangci/.golangci.yml

WORKDIR /home/golangci/
USER 1000:1000
ENTRYPOINT ["/usr/bin/golangci-lint","run", "-v"]
