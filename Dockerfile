FROM golangci/golangci-lint:v1.45.2-alpine@sha256:f785480652fef9878251e5f052ec0a2afc71005eb7c6817e3726de63cc49cd6d

RUN addgroup -g 1000 golangci && \
    adduser -D -u 1000 -G golangci golangci
COPY .golangci.yml /home/golangci/.golangci.yml

WORKDIR /home/golangci/
USER 1000:1000
ENTRYPOINT ["/usr/bin/golangci-lint","run", "-v"]
