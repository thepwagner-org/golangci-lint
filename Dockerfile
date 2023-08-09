FROM golangci/golangci-lint:v1.54.0-alpine@sha256:148c1766476bdfede44daa5b89800cc40d6f8a52500440b10fa85196090fb3d4

RUN addgroup -g 1000 golangci && \
    adduser -D -u 1000 -G golangci golangci
COPY .golangci.yml /home/golangci/.golangci.yml

WORKDIR /home/golangci/
USER 1000:1000
ENTRYPOINT ["/usr/bin/golangci-lint","run", "-v"]
