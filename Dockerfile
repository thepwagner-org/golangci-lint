FROM golangci/golangci-lint:v1.60.3-alpine@sha256:8326b535f6aff1995059a0025449e8fe150b3c8e48d7c310855302c638cb2ccf

RUN addgroup -g 1000 golangci && \
    adduser -D -u 1000 -G golangci golangci
COPY .golangci.yml /home/golangci/.golangci.yml

WORKDIR /home/golangci/
USER 1000:1000
ENTRYPOINT ["/usr/bin/golangci-lint","run", "-v"]
