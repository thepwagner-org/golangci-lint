FROM golangci/golangci-lint:v1.58.2-alpine@sha256:511101feba931bd578164b77714d1cee015d8980e0d40033c378b6626193e4ab

RUN addgroup -g 1000 golangci && \
    adduser -D -u 1000 -G golangci golangci
COPY .golangci.yml /home/golangci/.golangci.yml

WORKDIR /home/golangci/
USER 1000:1000
ENTRYPOINT ["/usr/bin/golangci-lint","run", "-v"]
