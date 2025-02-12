FROM golangci/golangci-lint:v1.64.2-alpine@sha256:4820f536bc335af594f0bc42c6accd29dbef5d468f733806954dbe7c4a342ede

RUN addgroup -g 1000 golangci && \
    adduser -D -u 1000 -G golangci golangci
COPY .golangci.yml /home/golangci/.golangci.yml

WORKDIR /home/golangci/
USER 1000:1000
ENTRYPOINT ["/usr/bin/golangci-lint","run", "-v"]
