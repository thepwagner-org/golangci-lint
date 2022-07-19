FROM golangci/golangci-lint:v1.47.1-alpine@sha256:319ec089d7506f6707abb81e94336abbb2997f98bbf48d6600f22efec0097f81

RUN addgroup -g 1000 golangci && \
    adduser -D -u 1000 -G golangci golangci
COPY .golangci.yml /home/golangci/.golangci.yml

WORKDIR /home/golangci/
USER 1000:1000
ENTRYPOINT ["/usr/bin/golangci-lint","run", "-v"]
