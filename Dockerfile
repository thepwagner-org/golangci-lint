FROM golangci/golangci-lint:v1.57.1-alpine@sha256:f9722608039a3568101c4193f53ead34b724a0135dd34cef2a3d94234ff6e550

RUN addgroup -g 1000 golangci && \
    adduser -D -u 1000 -G golangci golangci
COPY .golangci.yml /home/golangci/.golangci.yml

WORKDIR /home/golangci/
USER 1000:1000
ENTRYPOINT ["/usr/bin/golangci-lint","run", "-v"]
