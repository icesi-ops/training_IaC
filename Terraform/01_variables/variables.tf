variable "ports"{
    description = "This variable configure the ports"
    default = 80
    type = "string"
}

#HARDMODE

variable "docker_ports" {
  type = list(object({
    internal = number
    external = number
    protocol = string
  }))
  default = [
    {
      internal = 8300
      external = 8300
      protocol = "tcp"
    }
  ]
}
