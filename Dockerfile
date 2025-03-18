FROM golangci/golangci-lint:v1.64.8-alpine@sha256:ae6460f78db54f22838d2a8aee0f2eaa4f785d5a01f638600072b60848f8deb4

RUN addgroup -g 1000 golangci && \
    adduser -D -u 1000 -G golangci golangci
COPY .golangci.yml /home/golangci/.golangci.yml

WORKDIR /home/golangci/
USER 1000:1000
ENTRYPOINT ["/usr/bin/golangci-lint","run", "-v"]
