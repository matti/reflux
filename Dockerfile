FROM golang:1.13.10-alpine3.11 as builder

WORKDIR /build
COPY build/go.mod .

RUN go get github.com/cespare/reflex@e1e64e8a6dd7552a6e8f616474c91d4d089eada6

FROM golang:1.13.10-alpine3.11

COPY --from=builder /go/bin/reflex /usr/bin

WORKDIR /app
VOLUME ["/go/pkg/mod/cache"]

ENTRYPOINT [ "/usr/bin/reflex" ]
CMD [ "-s", "go", "run", "main.go" ]
