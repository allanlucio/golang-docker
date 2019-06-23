FROM golang AS builder

COPY . /go/
WORKDIR /go/src/semana2
RUN CGO_ENABLED=0 GOOS=linux go build -a -ldflags "-s -w" main.go
RUN chmod +x main.go



FROM busybox:1.30   
# WORKDIR /root/
COPY --from=builder /go/src/semana2/main .
ENTRYPOINT ["./main"] 