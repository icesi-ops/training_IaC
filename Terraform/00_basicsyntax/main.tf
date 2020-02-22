```tf
# Configure the Docker provider
provider "docker" {
    host = "tcp://127.0.0.1:2376"
}

# Create a container

resource "docker_container" "frontend"{

    image = "${docker_image.img_frontend.latest}"
    name = "CF1"
}

resource "docker_image" "img_frontend"{
    name = "frontend:latest"
}
```
