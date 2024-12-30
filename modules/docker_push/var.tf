variable "docker_image_name" {
  description = "Name of the Docker image"
  type        = string
}

variable "docker_image_tag" {
  description = "Tag for the Docker image"
  type        = string
}

variable "docker_hub_username" {
  description = "Docker Hub username"
  type        = string
}

variable "docker_hub_password" {
  description = "Docker Hub password"
  type        = string
  sensitive   = true
}

