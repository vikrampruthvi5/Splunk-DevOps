# Define the VPC
resource "aws_vpc" "my_vpc" {
  cidr_block = "172.32.0.0/16"
  tags = {
    Name = "${var.project}-vpc"
  }
}

# Create the internet gateway
resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    Name = "${var.project}-igw"
  }
}

# Create the route table
resource "aws_route_table" "my_route_table" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    Name = "${var.project}-rt"
  }
}

# Create a route for the internet gateway
resource "aws_route" "my_route" {
  route_table_id         = aws_route_table.my_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.my_igw.id
}

# Create the subnets
resource "aws_subnet" "subnet1" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = "172.32.0.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.project}-subnet1a"
  }
}

resource "aws_subnet" "subnet2" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "172.32.1.0/24"
  availability_zone = "us-east-1b"
  tags = {
    Name = "${var.project}-subnet1b"
  }
}

# Associate the subnets with the route table
resource "aws_route_table_association" "subnet1_association" {
  subnet_id      = aws_subnet.subnet1.id
  route_table_id = aws_route_table.my_route_table.id
}

resource "aws_route_table_association" "subnet2_association" {
  subnet_id      = aws_subnet.subnet2.id
  route_table_id = aws_route_table.my_route_table.id
}
