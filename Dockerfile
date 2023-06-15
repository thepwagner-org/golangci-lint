FROM golangci/golangci-lint:v1.53.3-alpine@sha256:b61d8503f0ad16499c023772301ec8c0f2559bf76c28d228c390446c5e647f55

RUN addgroup -g 1000 golangci && \
    adduser -D -u 1000 -G golangci golangci
COPY .golangci.yml /home/golangci/.golangci.yml

WORKDIR /home/golangci/
USER 1000:1000
ENTRYPOINT ["/usr/bin/golangci-lint","run", "-v"]
