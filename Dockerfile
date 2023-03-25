FROM golangci/golangci-lint:v1.52.2-alpine@sha256:639dbebd312e31bb470ef70e83967eb2840a8cea39e857ac6494df2fe1b324fa

RUN addgroup -g 1000 golangci && \
    adduser -D -u 1000 -G golangci golangci
COPY .golangci.yml /home/golangci/.golangci.yml

WORKDIR /home/golangci/
USER 1000:1000
ENTRYPOINT ["/usr/bin/golangci-lint","run", "-v"]
