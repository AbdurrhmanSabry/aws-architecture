resource "aws_subnet" "public_one" {
  vpc_id     = aws_vpc.terra_vpc.id
  cidr_block = var.public_subnet_one_cidr
  availability_zone = "${var.region}a"
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.name_environment}-sub-public_one"
  }
}
resource "aws_subnet" "public_two" {
  vpc_id     = aws_vpc.terra_vpc.id
  cidr_block = var.public_subnet_two_cidr
  availability_zone = "${var.region}b"
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.name_environment}-sub-public_two"
  }
}
resource "aws_subnet" "private_one" {
  vpc_id     = aws_vpc.terra_vpc.id
  cidr_block = var.private_subnet_one_cidr
  availability_zone = "${var.region}a"
  tags = {
    Name = "${var.name_environment}-sub-private_one"
  }
}
resource "aws_subnet" "private_two" {
  vpc_id     = aws_vpc.terra_vpc.id
  cidr_block = var.private_subnet_two_cidr
  availability_zone = "${var.region}b"
  tags = {
    Name = "${var.name_environment}-sub-private_two"
  }
}