FROM golangci/golangci-lint:v1.55.0-alpine@sha256:f3154040bf25ccabb1b7db1edd21debf750400855c814dfe74d9b793e5ef8362

RUN addgroup -g 1000 golangci && \
    adduser -D -u 1000 -G golangci golangci
COPY .golangci.yml /home/golangci/.golangci.yml

WORKDIR /home/golangci/
USER 1000:1000
ENTRYPOINT ["/usr/bin/golangci-lint","run", "-v"]
