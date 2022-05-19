resource "aws_route_table" "public_table" {
  vpc_id = aws_vpc.terra_vpc.id
  tags = {
    Name = "${var.name_environment}-public_table"
  }
}
resource "aws_route_table" "private_table" {
  vpc_id = aws_vpc.terra_vpc.id
  tags = {
    Name = "${var.name_environment}-private_table"
  }
}
resource "aws_route" "publicroute" {
  route_table_id              = aws_route_table.public_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id      = aws_internet_gateway.gw.id
  depends_on = [aws_route_table.public_table]
}
resource "aws_route" "privatroute" {
  route_table_id              = aws_route_table.private_table.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id = aws_nat_gateway.nat.id
  depends_on = [aws_route_table.private_table]
}

resource "aws_route_table_association" "public_one" {
  subnet_id      = aws_subnet.public_one.id
  route_table_id = aws_route_table.public_table.id
}
resource "aws_route_table_association" "public_two" {
  subnet_id      = aws_subnet.public_two.id
  route_table_id = aws_route_table.public_table.id
}
resource "aws_route_table_association" "Private_one" {
  subnet_id      = aws_subnet.private_one.id
  route_table_id = aws_route_table.private_table.id
}

resource "aws_route_table_association" "private_two" {
  subnet_id      = aws_subnet.private_two.id
  route_table_id = aws_route_table.private_table.id
}
