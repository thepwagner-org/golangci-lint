FROM golangci/golangci-lint:v1.63.1-alpine@sha256:1cd11d6be39b034189a4386d84a6ce0e34c76dcd826ebae2e61b07ee908df6e5

RUN addgroup -g 1000 golangci && \
    adduser -D -u 1000 -G golangci golangci
COPY .golangci.yml /home/golangci/.golangci.yml

WORKDIR /home/golangci/
USER 1000:1000
ENTRYPOINT ["/usr/bin/golangci-lint","run", "-v"]
