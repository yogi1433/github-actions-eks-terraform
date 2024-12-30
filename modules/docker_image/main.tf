terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

# Docker Provider Configuration
provider "docker" {
  host = "unix:///var/run/docker.sock"  # Local Docker daemon
}


resource "docker_image" "myweb_app" {
  name = "${var.docker_image_name}:${var.docker_image_tag}"

  build {
    context    = var.docker_file_path
    dockerfile = "Dockerfile"
   #  dockerfile = "Dockerfile"
  }
}

