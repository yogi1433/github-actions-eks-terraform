# IAM Role for Node Group
resource "aws_iam_role" "node_group_role" {
  name = "yogi_eks-node-group-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com"
        },
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "node_group_policies" {
  count      = 3
  role       = aws_iam_role.node_group_role.name
  policy_arn = element([
    "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy",
    "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly",
    "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  ], count.index)
}




# EKS Node Group
resource "aws_eks_node_group" "eks_node_group" {
  cluster_name    = var.cluster_name
  node_group_name  = var.eks_node_group_name
 # node_role_arn   = var.node_role_arn
  node_role_arn   = aws_iam_role.node_group_role.arn
  subnet_ids      = var.subnet_ids
  instance_types = var.instance_types
  remote_access {
    ec2_ssh_key               = var.key
    source_security_group_ids = [var.security_group_id]
  }

  scaling_config {
    desired_size = var.desired_size
    max_size     = var.max_size
    min_size     = var.min_size
  }

 # instance_types = var.instance_types

tags = merge(var.tags, {
    "Name" = var.eks_node_group_name
  })
}

