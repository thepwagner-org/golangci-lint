FROM golangci/golangci-lint:v1.64.5-alpine@sha256:05e1762ba74443e44b3a179e9549ad134a9ee2180d4fcc06b19a77ea0c6ac66a

RUN addgroup -g 1000 golangci && \
    adduser -D -u 1000 -G golangci golangci
COPY .golangci.yml /home/golangci/.golangci.yml

WORKDIR /home/golangci/
USER 1000:1000
ENTRYPOINT ["/usr/bin/golangci-lint","run", "-v"]
