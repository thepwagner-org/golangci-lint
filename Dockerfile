FROM golangci/golangci-lint:v1.54.2-alpine@sha256:e950721f6ae622dcc041f57cc0b61c3a78d4bbfc588facfc8b0166901a9f4848

RUN addgroup -g 1000 golangci && \
    adduser -D -u 1000 -G golangci golangci
COPY .golangci.yml /home/golangci/.golangci.yml

WORKDIR /home/golangci/
USER 1000:1000
ENTRYPOINT ["/usr/bin/golangci-lint","run", "-v"]
