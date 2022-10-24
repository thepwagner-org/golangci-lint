FROM golangci/golangci-lint:v1.50.1-alpine@sha256:a392d4e44049a444a927878792dae9534075ec57880e0657647ce818bd8278c2

RUN addgroup -g 1000 golangci && \
    adduser -D -u 1000 -G golangci golangci
COPY .golangci.yml /home/golangci/.golangci.yml

WORKDIR /home/golangci/
USER 1000:1000
ENTRYPOINT ["/usr/bin/golangci-lint","run", "-v"]
