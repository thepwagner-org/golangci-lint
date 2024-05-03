FROM golangci/golangci-lint:v1.58.0-alpine@sha256:fb28daa680f971595da14483eacbf58321daf7690516497d008e5f46eaf78001

RUN addgroup -g 1000 golangci && \
    adduser -D -u 1000 -G golangci golangci
COPY .golangci.yml /home/golangci/.golangci.yml

WORKDIR /home/golangci/
USER 1000:1000
ENTRYPOINT ["/usr/bin/golangci-lint","run", "-v"]
