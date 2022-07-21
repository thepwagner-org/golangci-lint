FROM golangci/golangci-lint:v1.47.2-alpine@sha256:10ed4891fdd1f7249f5e39d7c17ea746ce26adada3c05686c6aa31290abcd180

RUN addgroup -g 1000 golangci && \
    adduser -D -u 1000 -G golangci golangci
COPY .golangci.yml /home/golangci/.golangci.yml

WORKDIR /home/golangci/
USER 1000:1000
ENTRYPOINT ["/usr/bin/golangci-lint","run", "-v"]
