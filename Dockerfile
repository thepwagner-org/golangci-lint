FROM golangci/golangci-lint:v1.46.0-alpine@sha256:a9be740033fde5c19fdb2e9be5ae72b3d5742647606d29bb1c9f6bbcad075646

RUN addgroup -g 1000 golangci && \
    adduser -D -u 1000 -G golangci golangci
COPY .golangci.yml /home/golangci/.golangci.yml

WORKDIR /home/golangci/
USER 1000:1000
ENTRYPOINT ["/usr/bin/golangci-lint","run", "-v"]
