# Use official Golang image as a builder
FROM golang:1.24.2 AS builder

# Set working directory inside the container
WORKDIR /app

# Copy go.mod and go.sum to download dependencies
COPY backend/go.mod backend/go.sum* ./
RUN go mod download || true

# Copy the rest of the application code
COPY backend/ .

# Build the Go binary
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o server main.go

# Use a lightweight image for running the app
FROM alpine:latest

WORKDIR /app

# Install bash
RUN apk add --no-cache bash

# Copy the wait-for-it script
COPY wait-for-it.sh /usr/local/bin/wait-for-it.sh
RUN chmod +x /usr/local/bin/wait-for-it.sh

# Copy built binary from the builder stage
COPY --from=builder /app/server /app/server

# Ensure the binary has execution permissions
RUN chmod +x /app/server

# Expose the port
EXPOSE 8080

# Run the binary with wait-for-it
CMD ["wait-for-it.sh", "db:5432", "--", "/app/server"]
