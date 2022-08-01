FROM golangci/golangci-lint:v1.47.3-alpine@sha256:438f86d4521660b7c21cf06c50fc0bce4e26ba2a47434a88cc15495319e9c225

RUN addgroup -g 1000 golangci && \
    adduser -D -u 1000 -G golangci golangci
COPY .golangci.yml /home/golangci/.golangci.yml

WORKDIR /home/golangci/
USER 1000:1000
ENTRYPOINT ["/usr/bin/golangci-lint","run", "-v"]
