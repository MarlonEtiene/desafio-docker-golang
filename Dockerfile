FROM golang:1.13-alpine3.11 as builder
RUN mkdir app/
COPY cmd/*.* app/
WORKDIR app/
RUN CGO_ENABLED=0 go build -ldflags "-w" main.go

FROM scratch
COPY --from=builder /go/app/main .
CMD ["./main"]
