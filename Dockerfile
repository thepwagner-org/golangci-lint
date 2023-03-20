FROM golangci/golangci-lint:v1.52.0-alpine@sha256:eebb3f3f69d14a434ae261540d23951ee8794d0ce862362e4babc76c01000b5c

RUN addgroup -g 1000 golangci && \
    adduser -D -u 1000 -G golangci golangci
COPY .golangci.yml /home/golangci/.golangci.yml

WORKDIR /home/golangci/
USER 1000:1000
ENTRYPOINT ["/usr/bin/golangci-lint","run", "-v"]
