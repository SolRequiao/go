FROM golang:alpine as go

WORKDIR /go/src/app

COPY . .

RUN CGO_ENABLED=0 go build -o /app main.go

FROM scratch

COPY --from=go /app /app

CMD ["/app"]