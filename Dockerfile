FROM golangci/golangci-lint:v1.53.2-alpine@sha256:a52d65f65b92fe9bd4fbb831d6f347bb37e81acf700cc33c078870e26d42f160

RUN addgroup -g 1000 golangci && \
    adduser -D -u 1000 -G golangci golangci
COPY .golangci.yml /home/golangci/.golangci.yml

WORKDIR /home/golangci/
USER 1000:1000
ENTRYPOINT ["/usr/bin/golangci-lint","run", "-v"]
