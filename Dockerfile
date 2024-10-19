FROM golang:1.19-alpine AS builder

WORKDIR /app

ENV GO111MODULE=off

COPY main.go .

RUN go build -o fullcycle

FROM scratch

COPY --from=builder /app/fullcycle /fullcycle

ENTRYPOINT ["/fullcycle"]