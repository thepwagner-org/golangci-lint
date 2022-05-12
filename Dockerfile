FROM golangci/golangci-lint:v1.46.1-alpine@sha256:a8ad0a8859722a323e1c55d079444b5e26d0b94b37ce5217f22860b2b913aa81

RUN addgroup -g 1000 golangci && \
    adduser -D -u 1000 -G golangci golangci
COPY .golangci.yml /home/golangci/.golangci.yml

WORKDIR /home/golangci/
USER 1000:1000
ENTRYPOINT ["/usr/bin/golangci-lint","run", "-v"]
