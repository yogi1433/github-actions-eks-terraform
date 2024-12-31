variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
}

variable "cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnets" {
  description = "List of public subnet CIDR blocks"
  type        = list(string)
}

variable "private_subnets" {
  description = "List of private subnet CIDR blocks"
  type        = list(string)
}

variable "environment" {
  description = "Environment"
  type        = string
}

variable "project" {
  description = "Project name"
  type        = string
}

variable "owner" {
  description = "Owner of the project"
  type        = string
}

####################### changes #########

variable "instance_type" {
  description = "Type of the EC2 instance for EKS management"
  type        = string
}

variable "key" {
  description = "SSH key pair for EC2 instance"
  type        = string
}

variable "instance_name" {
  description = "Name tag for the EC2 instance"
  type        = string
}

variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

####nodes##########

variable "instance_types" {
  description = "Node instance type"
  type        = list(string)
}

variable "eks_node_group_name" {
  description = "eks_node_group_name"
  type        = string
}

variable "desired_size" {
  description = "Node desired size"
  type        = string
}

variable "max_size" {
  description = "Node max size"
  type        = string
}

variable "min_size" {
  description = "Node min size"
  type        = string
}

variable "node_role_arn" {
  description = "IAM role ARN for the Node Group"
  type        = string
}
########## Variables for Docker image ###############

# Variables
# variable "docker_image_name" {
#   description = "Name of the Docker image"
#   type        = string
# }

# variable "docker_image_tag" {
#   description = "Tag for the Docker image"
#   type        = string
# }

# variable "docker_file_path" {
#   description = "Path to the directory containing the Dockerfile "
#   type        = string
# }

# variable "docker_hub_username" {
#   description = "Your Docker Hub username"
#   type        = string
# }

# variable "docker_hub_password" {
#   description = "Your Docker Hub password"
#   type        = string
#   sensitive   = true
# }


