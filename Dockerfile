FROM golang:1.16-alpine

# Set destination for COPY
WORKDIR /app

# Download Go modules
COPY go.mod .
COPY go.sum .
RUN go mod download

COPY *.go ./

# Build
RUN go build -o /docker-gs-ping

EXPOSE 8080


# Run
CMD [ "/docker-gs-ping" ]

#FROM golang:1.17-alpine AS build
#
#WORKDIR /src/
#COPY main.go go.* /src/
#RUN CGO_ENABLED=0 go build -o /bin/demo
#
#FROM scratch
#COPY --from=build /bin/demo /bin/demo
