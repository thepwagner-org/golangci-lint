FROM golangci/golangci-lint:v1.58.1-alpine@sha256:a71d17adb616b7b34785ce63343fa50cc9764b3fd7aadf27ba69f07fe10c6382

RUN addgroup -g 1000 golangci && \
    adduser -D -u 1000 -G golangci golangci
COPY .golangci.yml /home/golangci/.golangci.yml

WORKDIR /home/golangci/
USER 1000:1000
ENTRYPOINT ["/usr/bin/golangci-lint","run", "-v"]
