FROM golangci/golangci-lint:v1.57.0-alpine@sha256:fc1a85ed43171ecc4a6cf378260d25f78f0b1ce2254eb97d42143bfe7a50de29

RUN addgroup -g 1000 golangci && \
    adduser -D -u 1000 -G golangci golangci
COPY .golangci.yml /home/golangci/.golangci.yml

WORKDIR /home/golangci/
USER 1000:1000
ENTRYPOINT ["/usr/bin/golangci-lint","run", "-v"]
