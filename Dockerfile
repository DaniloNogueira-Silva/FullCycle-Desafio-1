FROM golang:alpine AS builder

WORKDIR /go/src/app
COPY . .

RUN go mod init github.com/DaniloNogueira-Silva/FullCycle-Desafio-1
RUN go build -o main .

FROM scratch
COPY --from=builder /go/src/app/main /app/

CMD ["/app/main"]
