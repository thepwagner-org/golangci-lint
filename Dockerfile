FROM golangci/golangci-lint:v2.0.0-alpine@sha256:d64fe8d2a4497670dee71777c339cbc578cb8ad075f7c2359007d8331acf8123

RUN addgroup -g 1000 golangci && \
    adduser -D -u 1000 -G golangci golangci
COPY .golangci.yml /home/golangci/.golangci.yml

WORKDIR /home/golangci/
USER 1000:1000
ENTRYPOINT ["/usr/bin/golangci-lint","run", "-v"]
