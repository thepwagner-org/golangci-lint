FROM golangci/golangci-lint:v1.57.2-alpine@sha256:90e1137558d1d226d8078cad24b7b34e26e86ff882245db06ea83780d91550d2

RUN addgroup -g 1000 golangci && \
    adduser -D -u 1000 -G golangci golangci
COPY .golangci.yml /home/golangci/.golangci.yml

WORKDIR /home/golangci/
USER 1000:1000
ENTRYPOINT ["/usr/bin/golangci-lint","run", "-v"]
