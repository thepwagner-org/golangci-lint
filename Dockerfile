FROM golangci/golangci-lint:v1.56.1-alpine@sha256:17f37c069f4a7c28c7397d8d2bc9eee256d5aebf403cf444927962c6fa37f8a7

RUN addgroup -g 1000 golangci && \
    adduser -D -u 1000 -G golangci golangci
COPY .golangci.yml /home/golangci/.golangci.yml

WORKDIR /home/golangci/
USER 1000:1000
ENTRYPOINT ["/usr/bin/golangci-lint","run", "-v"]
