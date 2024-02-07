FROM golangci/golangci-lint:v1.56.0-alpine@sha256:260ddbde65533a7a34deca97c4b171f70a16c5609ed42f1605d3b8cd20dab0ca

RUN addgroup -g 1000 golangci && \
    adduser -D -u 1000 -G golangci golangci
COPY .golangci.yml /home/golangci/.golangci.yml

WORKDIR /home/golangci/
USER 1000:1000
ENTRYPOINT ["/usr/bin/golangci-lint","run", "-v"]
