# Use a minimal base image to run the Go app
FROM alpine:latest AS base

# Set the working directory inside the container
WORKDIR /root/

# Expose the ports
EXPOSE 3000
EXPOSE 3001

# Use the official Golang image as builder stage
FROM golang:1.18 AS builder

# Set the working directory inside the container
WORKDIR /app

# Copy the Go modules manifests
COPY go.mod go.sum ./

# Download the Go modules
RUN go mod download

# Copy the source code
COPY . .

# Build the Go app
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o main .

# Verify that the binary exists
RUN ls -l main

# Use the minimal base image to run the Go app
FROM base

# Set the working directory inside the container
WORKDIR /root/

# Copy the pre-built binary from the builder stage
COPY --from=builder /app/main .

# Ensure the binary has execution permissions
RUN chmod +x ./main

# Command to run the Go app with default server type
CMD ["./main", "-server", "echo"]