
variable "eks_node_group_name" {
  description = "Name of the Node Group"
  type        = string
}
variable "key" {
  description = "Name of the SSH key pair for the Node Group"
  type        = string
}

variable "desired_size" {
  description = "Desired number of nodes in the Node Group"
  type        = number
}

variable "max_size" {
  description = "Maximum number of nodes in the Node Group"
  type        = number
}

variable "min_size" {
  description = "Minimum number of nodes in the Node Group"
  type        = number
}

variable "instance_types" {
  description = "List of EC2 instance types for the Node Group"
  type        = list(string)
}

variable "cluster_name" {
  description = "Name of the EKS Cluster"
  type        = string
}
variable "node_role_arn" {
  description = "IAM role ARN for the Node Group"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for the node group"
  type        = list(string)
}

variable "security_group_id" {
  description = "Security group ID for node group instances"
  type        = string
}

variable "tags" {
  description = "A map of tags to apply to the node group"
  type        = map(string)
  default     = {}
}


