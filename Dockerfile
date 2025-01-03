FROM golangci/golangci-lint:v1.63.3-alpine@sha256:11f58613b37fc8e1ecb4bb30805f21c89f72bb7a39f4e21ca993f6ed0143d881

RUN addgroup -g 1000 golangci && \
    adduser -D -u 1000 -G golangci golangci
COPY .golangci.yml /home/golangci/.golangci.yml

WORKDIR /home/golangci/
USER 1000:1000
ENTRYPOINT ["/usr/bin/golangci-lint","run", "-v"]
