provider "docker"{

}

resource "docker_container" "Container1" {

    image = "${docker_image.img_c1.latest}"
    name = "CF1"
    rm = true
    attach = false

    ports = {

        internal = "${var.ports}"
        external = "${var.ports}"
    }



}

resource "docker_image" "img_c1"{

    name = "aik-frontend:1.0.1"


}



