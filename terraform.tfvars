vpc_name            = "eks_vpc"
cidr_block          = "10.0.0.0/16"
public_subnets      = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnets     = ["10.0.3.0/24", "10.0.4.0/24"]
environment         = "dev"
project             = "arsaminor"
owner               = "Latheef"
instance_type       = "t2.micro"
key                 = "eks-manager"
instance_name       = "Managemnetnode"
cluster_name        = "eks-latheef-cluster"
instance_types      = ["t3.medium"]
desired_size        = 2
max_size            = 3
min_size            = 1
eks_node_group_name = "eks-latheef-node-gp"
node_role_arn       = "aws_iam_role.node_group_role.arn"

###### tfvars for docker image ###########

docker_image_name = "myweb-app5"
docker_image_tag = "latest"
docker_file_path = "./"
docker_hub_username = ""
docker_hub_password = ""

