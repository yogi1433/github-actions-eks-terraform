terraform {
  required_version = ">= 1.3.0, < 2.0.0" # Ensure compatibility with your Terraform version
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0.0" # Define provider version constraints
    }
  }
}



module "eks_vpc" {
  source      = "./modules/vpc"
  vpc_name    = var.vpc_name
  cidr_block  = var.cidr_block
  environment = var.environment
  project     = var.project
  owner       = var.owner
}

module "eks_subnets" {
  source          = "./modules/subnets"
  vpc_id          = module.eks_vpc.vpc_id
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
  environment     = var.environment
  project         = var.project
  owner           = var.owner
}

module "eks_igw" {
  source      = "./modules/igw"
  vpc_id      = module.eks_vpc.vpc_id
  public_subnet_ids = var.public_subnets
  public_subnet_id = module.eks_subnets.public_subnets[0]
  environment = var.environment
  project     = var.project
  owner       = var.owner

}

module "eks_route_tables" {
  source          = "./modules/route_tables"
  vpc_id          = module.eks_vpc.vpc_id
  igw_id          = module.eks_igw.igw_id
  public_subnets  = module.eks_subnets.public_subnets
  private_subnets = module.eks_subnets.private_subnets
  ngw_id = module.eks_igw.ngw_id
  #  public_route_table_id  = aws_route_table.public.id
  # private_route_table_id = aws_route_table.private.id
  environment = var.environment
  project     = var.project
  owner       = var.owner
}

module "subnet_associations" {
  source = "./modules/subnet_associations"

  public_subnets         = module.eks_subnets.public_subnets
  private_subnets        = module.eks_subnets.private_subnets
  public_route_table_id  = module.eks_route_tables.public_route_table_id
  private_route_table_id = module.eks_route_tables.private_route_table_id
}

module "eks_security_group" {
  source      = "./modules/security_group"
  vpc_id      = module.eks_vpc.vpc_id
  environment = var.environment
  project     = var.project
  owner       = var.owner
}


module "ec2_instance" {
  source                 = "./modules/ec2"
  instance_type          = var.instance_type
  key_name               = var.key
  associate_public_ip    = true
  instance_name          = var.instance_name
  user_data              = "app.sh"
  vpc_security_group_ids = [module.eks_security_group.allow_all_sg_id]
  # vpc_security_group_ids = [module.eks_security_group.security_group_id] 
  subnet_id = module.eks_subnets.public_subnets[0]
  # vpc_id             = module.eks_vpc.vpc_id  # Using vpc_id from eks_vpc module
}

##### EKS-CLUSter#############
module "eks_cluster" {
  source            = "./modules/eks"
  cluster_name      = var.cluster_name
  vpc_id            = module.eks_vpc.vpc_id
  public_subnet_ids = module.eks_subnets.public_subnets
  # security_group_id  = module.eks_security_group.security_group_id
  security_group_id = module.eks_security_group.allow_all_sg_id
  tags = {
    Environment = var.environment
    Project     = var.project
  }
}

#####node group #######################
module "eks_node_group" {
  source              = "./modules/nodes"
  cluster_name        = module.eks_cluster.cluster_name
  eks_node_group_name = var.eks_node_group_name
  node_role_arn       = var.node_role_arn
  subnet_ids          = module.eks_subnets.private_subnets
  key                 = var.key
  desired_size        = var.desired_size
  max_size            = var.max_size
  min_size            = var.min_size
  instance_types      = var.instance_types
  security_group_id   = module.eks_security_group.allow_all_sg_id

  tags = {
    Environment = var.environment
    Project     = var.project
    Name        = var.eks_node_group_name
  }
}

##### docker related  #######################
# module "docker_image" {
#   source           = "./modules/docker_image"
#   docker_image_name       = var.docker_image_name
#   docker_image_tag        = var.docker_image_tag
#   docker_file_path = var.docker_file_path
#   docker_hub_username = var.docker_hub_username
#   docker_hub_password = var.docker_hub_password
# }

# module "docker_push" {
#   source             = "./modules/docker_push"
#   docker_image_name         = module.docker_image.image_name
#   docker_image_tag          = var.docker_image_tag
#   docker_hub_username = var.docker_hub_username
#   docker_hub_password = var.docker_hub_password
# }




