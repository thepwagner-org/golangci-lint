FROM golangci/golangci-lint:v2.0.1-alpine@sha256:66854a432087d43cee95e82406b895f93a2cf6448e3edc67f46ce057dab07c7a

RUN addgroup -g 1000 golangci && \
    adduser -D -u 1000 -G golangci golangci
COPY .golangci.yml /home/golangci/.golangci.yml

WORKDIR /home/golangci/
USER 1000:1000
ENTRYPOINT ["/usr/bin/golangci-lint","run", "-v"]
