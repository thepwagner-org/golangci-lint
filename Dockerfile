FROM golangci/golangci-lint:v1.60.1-alpine@sha256:e71ee0fd4db9214586a95cbdd0237bcb2f2b4ddfdf55805dfeb3bcf6cbab3333

RUN addgroup -g 1000 golangci && \
    adduser -D -u 1000 -G golangci golangci
COPY .golangci.yml /home/golangci/.golangci.yml

WORKDIR /home/golangci/
USER 1000:1000
ENTRYPOINT ["/usr/bin/golangci-lint","run", "-v"]
