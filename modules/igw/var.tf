variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "environment" {
  description = "Environment (e.g., dev, prod)"
  type        = string
}

variable "project" {
  description = "Project name"
  type        = string
}
variable "public_subnet_id" {
  description = "Project name "
  type        = string
}
variable "public_subnet_ids" {
  description = "List of public subnet IDs for the EKS cluster"
  type        = list(string)
}


variable "owner" {
  description = "Owner of the project"
  type        = string
}

