FROM golangci/golangci-lint:v1.56.2-alpine@sha256:6324441960be114e0496d04c52395abe973b66db54ce51a5a9e64aaf08ac6299

RUN addgroup -g 1000 golangci && \
    adduser -D -u 1000 -G golangci golangci
COPY .golangci.yml /home/golangci/.golangci.yml

WORKDIR /home/golangci/
USER 1000:1000
ENTRYPOINT ["/usr/bin/golangci-lint","run", "-v"]
