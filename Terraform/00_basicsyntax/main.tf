```tf
# Configure the Docker provider
provider "docker" {
    
}

# Create a container

resource "docker_container" "frontend" {
  image = "${docker_image.img_frontend.latest}"
  name  = "CF1"
  rm = true
  attach = false
  ports = {
      internal = "80"
      external = "8080"
  }
}

resource "docker_image" "img_frontend" {
  name = "facebook:1.0.7"
}

```
