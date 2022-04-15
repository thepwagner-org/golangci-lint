FROM golangci/golangci-lint:v1.45.2-alpine@sha256:f785480652fef9878251e5f052ec0a2afc71005eb7c6817e3726de63cc49cd6d

ENTRYPOINT ["/usr/bin/golangci-lint","run"]
