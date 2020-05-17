FROM golang:1.14.2-alpine3.11 as builder

WORKDIR /build

ENV GO111MODULE=on
RUN go get github.com/cespare/reflex@e1e64e8a6dd7552a6e8f616474c91d4d089eada6

# ---
FROM golang:1.14.2-alpine3.11

RUN apk add --no-cache \
  bash git

COPY --from=builder /go/bin/reflex /usr/bin
COPY reflux /

ONBUILD WORKDIR /app
ONBUILD COPY go.* ./
ONBUILD RUN go mod download -x
ONBUILD COPY . .

ENTRYPOINT [ "/reflux" ]
