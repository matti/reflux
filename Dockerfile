FROM golang:1.13.10-alpine3.11 as builder

WORKDIR /app
COPY go.mod .
RUN go get github.com/cespare/reflex@e1e64e8a6dd7552a6e8f616474c91d4d089eada6

FROM golang:1.13.10-alpine3.11
RUN apk add --no-cache \
  bash curl

COPY --from=builder /go/bin/reflex /usr/bin
COPY reflex.conf /

WORKDIR /app
VOLUME ["/go/pkg/mod/cache"]
ENTRYPOINT ["reflex", "-c", "/reflex.conf"]

ONBUILD COPY app .
