FROM golangci/golangci-lint:v1.50.0-alpine@sha256:07adfc4af05aaff300f582b9f27300878101bf5c2e18d193bf9ea5f3e1041cbc

RUN addgroup -g 1000 golangci && \
    adduser -D -u 1000 -G golangci golangci
COPY .golangci.yml /home/golangci/.golangci.yml

WORKDIR /home/golangci/
USER 1000:1000
ENTRYPOINT ["/usr/bin/golangci-lint","run", "-v"]
