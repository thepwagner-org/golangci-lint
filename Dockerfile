FROM golangci/golangci-lint:v1.48.0-alpine@sha256:e9ce901b7974d641d6288b070fc619d199a823d0f696563fec8be90f19789b57

RUN addgroup -g 1000 golangci && \
    adduser -D -u 1000 -G golangci golangci
COPY .golangci.yml /home/golangci/.golangci.yml

WORKDIR /home/golangci/
USER 1000:1000
ENTRYPOINT ["/usr/bin/golangci-lint","run", "-v"]
