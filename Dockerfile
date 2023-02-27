FROM golangci/golangci-lint:v1.51.2-alpine@sha256:d4441632fdd9787214ebcfe026339adb9ab24a94026df18c8835893bfcdc9e27

RUN addgroup -g 1000 golangci && \
    adduser -D -u 1000 -G golangci golangci
COPY .golangci.yml /home/golangci/.golangci.yml

WORKDIR /home/golangci/
USER 1000:1000
ENTRYPOINT ["/usr/bin/golangci-lint","run", "-v"]
