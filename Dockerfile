FROM golangci/golangci-lint:v1.51.0-alpine@sha256:1c03377ae2cffd18b89671cee2ef84ed4f44516e0661e3e490fa09ae3621e496

RUN addgroup -g 1000 golangci && \
    adduser -D -u 1000 -G golangci golangci
COPY .golangci.yml /home/golangci/.golangci.yml

WORKDIR /home/golangci/
USER 1000:1000
ENTRYPOINT ["/usr/bin/golangci-lint","run", "-v"]
