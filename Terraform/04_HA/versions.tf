terraform {
  required_providers {
    docker = {
      source = "terraform-providers/docker"
    }
    aws = {
      source = "hashicorp/aws"
    }
  }
  required_version = ">= 0.13"
}
