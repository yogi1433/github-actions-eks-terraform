# Variables
variable "docker_image_name" {
  description = "Name of the Docker image"
  type        = string
}

variable "docker_image_tag" {
  description = "Tag for the Docker image"
  type        = string
}

variable "docker_file_path" {
  description = "Path to the directory containing the Dockerfile"
  type        = string
}

# variable "docker_hub_username" {
#   description = "Your Docker Hub username"
#   type        = string
# }

# variable "docker_hub_password" {
#   description = "Your Docker Hub password"
#   type        = string
#   sensitive   = true
# }


