FROM golangci/golangci-lint:v1.47.0-alpine@sha256:b96e513a4124a8010c586cec28bfc9ece5337f997947692d5c1a08395f05a08e

RUN addgroup -g 1000 golangci && \
    adduser -D -u 1000 -G golangci golangci
COPY .golangci.yml /home/golangci/.golangci.yml

WORKDIR /home/golangci/
USER 1000:1000
ENTRYPOINT ["/usr/bin/golangci-lint","run", "-v"]
