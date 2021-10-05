FROM golang:alpine AS builder 
WORKDIR /go/src/app
RUN go mod init app
COPY go/rocks.go .
RUN go build -o rocks

FROM scratch
WORKDIR /app
COPY --from=builder /go/src/app .
CMD ["./rocks"]