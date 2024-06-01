# Define the image name
IMAGE_NAME = dynamic-app

# Build the Docker image
build:
	docker build -t $(IMAGE_NAME) .

# Run the Echo server container
run-echo:
	docker run --name echo-server -p 3000:3000 $(IMAGE_NAME) ./main -server echo

# Run the Gin server container
run-gin:
	docker run --name gin-server -p 3001:3001 $(IMAGE_NAME) ./main -server gin

# Clean up Docker images and containers
clean:
	docker rm -f echo-server gin-server || true
	docker rmi -f $(IMAGE_NAME) || true

# Shortcut to rebuild and run the Echo server
rebuild-echo: clean build run-echo

# Shortcut to rebuild and run the Gin server
rebuild-gin: clean build run-gin
