resource "aws_vpc" "vpc" {
   cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  tags = {
    Name ="My VPC"
    Tarrform=var.Terraform
    Environment=var.Environment 
    Project=var.Project
  }
}
resource "aws_subnet" "public_subnet" {
  count=length(var.azs)
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.public_cidr[count.index]
  availability_zone = var.azs[count.index]
  map_public_ip_on_launch =  true

  tags = {
    Name= "${var.azs[count.index]}-${var.Project}-public subnet"
    Tarrform=var.Terraform
    Environment=var.Environment 
    Project=var.Project
  }
}
resource "aws_subnet" "private_subnet" {
  count=length(var.azs)
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.private_cidr[count.index]
  availability_zone = var.azs[count.index]
  tags = {
    Name= "${var.azs[count.index]}-${var.Project}-private subnet"
    Tarrform=var.Terraform
    Environment=var.Environment 
    Project=var.Project
  }
}

resource "aws_internet_gateway" "Igw" {
  vpc_id = aws_vpc.vpc.id

   tags = {
    Name= "${var.Project} Internet Gateway"
    Tarrform=var.Terraform
    Environment=var.Environment 
    Project=var.Project
  }
}

resource "aws_eip" "my_eip" {
  domain = "vpc"
 tags = {
    Name = "${var.Project} eip"
    Tarrform=var.Terraform
    Environment=var.Environment 
    Project=var.Project
  }
}
resource "aws_nat_gateway" "NGW" {
  allocation_id                  = aws_eip.my_eip.id
  subnet_id                      = aws_subnet.public_subnet[0].id
  tags = {
    Name = "${var.Project} NGW"
    Tarrform=var.Terraform
    Environment=var.Environment 
    Project=var.Project
  }
  depends_on = [aws_internet_gateway.Igw]
}

resource "aws_route_table" "public_RT" {
  vpc_id = aws_vpc.vpc.id
 tags = {
    Name = "${var.Project} public RT"
    Tarrform=var.Terraform
    Environment=var.Environment 
    Project=var.Project
  }
   
}
resource "aws_route_table" "private_RT" {
  vpc_id = aws_vpc.vpc.id
 tags = {
    Name = "${var.Project} private RT"
    Tarrform=var.Terraform
    Environment=var.Environment 
    Project=var.Project
  }
}

resource "aws_route" "public_route" {
  route_table_id            = aws_route_table.public_RT.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.Igw.id
}
resource "aws_route" "private_route" {
  route_table_id            = aws_route_table.private_RT.id
  destination_cidr_block    = "0.0.0.0/0"
  nat_gateway_id = aws_nat_gateway.NGW.id
}

resource "aws_route_table_association" "Public_RT_Ass" {
    count=length(var.public_cidr)
  subnet_id      = aws_subnet.public_subnet[count.index].id
  route_table_id = aws_route_table.public_RT.id
}
resource "aws_route_table_association" "Private_RT_Ass" {
    count=length(var.private_cidr)
  subnet_id      = aws_subnet.private_subnet[count.index].id
  route_table_id = aws_route_table.private_RT.id
}
