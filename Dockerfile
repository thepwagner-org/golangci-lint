FROM golangci/golangci-lint:v1.46.2-alpine@sha256:6a09f1e87ecce4eab163470467cd88dab3a0efa31cb708ba6d514a6889816095

RUN addgroup -g 1000 golangci && \
    adduser -D -u 1000 -G golangci golangci
COPY .golangci.yml /home/golangci/.golangci.yml

WORKDIR /home/golangci/
USER 1000:1000
ENTRYPOINT ["/usr/bin/golangci-lint","run", "-v"]
