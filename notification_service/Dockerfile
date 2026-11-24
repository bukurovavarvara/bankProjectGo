# syntax=docker/dockerfile:1

FROM golang:1.24-alpine AS build
WORKDIR /src
ENV CGO_ENABLED=0 GOWORK=off

COPY go.mod go.sum* ./
RUN go mod download

COPY . .
RUN go build -trimpath -ldflags="-s -w" -o /out/app .

FROM gcr.io/distroless/static-debian12:nonroot
COPY --from=build /out/app /app
USER nonroot:nonroot
ENTRYPOINT ["/app"]
