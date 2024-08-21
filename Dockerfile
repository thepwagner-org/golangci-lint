FROM golangci/golangci-lint:v1.60.2-alpine@sha256:cdf9edf89317db796b51eda2e91a0671efd3447789ddc20a65e4115a927f1650

RUN addgroup -g 1000 golangci && \
    adduser -D -u 1000 -G golangci golangci
COPY .golangci.yml /home/golangci/.golangci.yml

WORKDIR /home/golangci/
USER 1000:1000
ENTRYPOINT ["/usr/bin/golangci-lint","run", "-v"]
