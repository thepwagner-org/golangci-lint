FROM golangci/golangci-lint:v1.62.0-alpine@sha256:a94c2da655a1f3e66bb7d2c9232324def349f2ba56a3d715d89e83d98f5bd933

RUN addgroup -g 1000 golangci && \
    adduser -D -u 1000 -G golangci golangci
COPY .golangci.yml /home/golangci/.golangci.yml

WORKDIR /home/golangci/
USER 1000:1000
ENTRYPOINT ["/usr/bin/golangci-lint","run", "-v"]
