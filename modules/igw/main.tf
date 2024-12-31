resource "aws_internet_gateway" "eks_igw" {
  vpc_id = var.vpc_id

  tags = {
    Name        = "Internet Gateway"
    Environment = var.environment
    Project     = var.project
    Owner       = var.owner
  }
}
# Create an Elastic IP
resource "aws_eip" "nat_gateway_eip" {
  vpc = true
}
# Create a NAT Gateway
resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat_gateway_eip.id
  subnet_id     = var.public_subnet_id 
    tags = {
    Name = "NAT Gateway"
  }
}
output "igw_id" {
  value = aws_internet_gateway.eks_igw.id
}
output "ngw_id" {
  value = aws_nat_gateway.nat_gateway.id
}