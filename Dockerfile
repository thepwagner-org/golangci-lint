FROM golangci/golangci-lint:v1.64.6-alpine@sha256:65e406735929c1c52f71e5b5524644627fb03538fc32c2119e193512ad78adbb

RUN addgroup -g 1000 golangci && \
    adduser -D -u 1000 -G golangci golangci
COPY .golangci.yml /home/golangci/.golangci.yml

WORKDIR /home/golangci/
USER 1000:1000
ENTRYPOINT ["/usr/bin/golangci-lint","run", "-v"]
