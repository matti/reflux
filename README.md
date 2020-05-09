# reflux

https://github.com/cespare/reflex on steroids

## usage

Assumes go.mod and go.sum in the root of the Docker build context.

### Dockerfile

```
FROM mattipaksula/reflux:1.13.10-alpine3.11

CMD [ "go run main.go" ]
```

### docker-compose.yml

```
version: "3.7"

services:
  app:
    build: .
    volumes:
      - ./:/app
```
