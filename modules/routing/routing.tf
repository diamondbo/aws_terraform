resource "aws_route_table" "public_route_table" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  
  tags = {
    Name = "public route table"
  }
}


resource "aws_internet_gateway" "gw" {
  vpc_id = var.vpc_id

  tags = {
    Name = "main"
  }
}

resource "aws_route_table" "private_route_table" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.k3_nat_gateway.id
  }

  
  tags = {
    Name = " private route table"
  }
}

resource "aws_nat_gateway" "k3_nat_gateway" {
  allocation_id = aws_eip.lb.id
  subnet_id     = var.public_subnet_id_1

  tags = {
    Name = "gw NAT"
  }

  depends_on = [aws_eip.lb]
}

resource "aws_eip" "lb" {
  domain   = "vpc"
}

resource "aws_route_table_association" "public1" {
  subnet_id      = var.public_subnet_id_1
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "public2" {
  subnet_id      = var.public_subnet_id_2
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "public3" {
  subnet_id      = var.public_subnet_id_3
  route_table_id = aws_route_table.public_route_table.id
}
resource "aws_route_table_association" "private1" {
  subnet_id      = var.private_subnet_id_1
  route_table_id = aws_route_table.private_route_table.id
}
resource "aws_route_table_association" "private2" {
  subnet_id      = var.private_subnet_id_2
  route_table_id = aws_route_table.private_route_table.id
}
resource "aws_route_table_association" "private3" {
  subnet_id      = var.private_subnet_id_3
  route_table_id = aws_route_table.private_route_table.id
}