# Use local-exec provisioner to push the Docker image to Docker Hub
resource "null_resource" "push_to_docker_hub" {
 # depends_on = [docker_image.myweb_app]

  provisioner "local-exec" {
    command = <<EOT
      # Log in to Docker Hub
      echo "${var.docker_hub_password}" | docker login -u "${var.docker_hub_username}" --password-stdin

      # Tag the image
      docker tag ${var.docker_image_name}:${var.docker_image_tag} ${var.docker_hub_username}/${var.docker_image_name}:${var.docker_image_tag}

      # Push the image to Docker Hub
      docker push ${var.docker_hub_username}/${var.docker_image_name}:${var.docker_image_tag}
# Log out from Docker Hub
      docker logout
    EOT
  }
}

