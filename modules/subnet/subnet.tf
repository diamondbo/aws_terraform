resource "aws_subnet" "k3subnet" {
  vpc_id = var.vpc_id
  availability_zone = var.availability_zone
  cidr_block = var.subnet_cidr_block
  map_public_ip_on_launch = var.is_public
  tags = {
    "Environment" = "Test"
    "Owner" = "k3"
  }
}