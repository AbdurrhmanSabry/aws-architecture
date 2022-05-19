output "vpc_id" {
    value = aws_vpc.terra_vpc.id
}
output "sub-public_one_id" {
  value = aws_subnet.public_one.id
}
output "sub-public_two_id" {
    value =  aws_subnet.public_two.id
}
output "sub-private_one_id" {
    value = aws_subnet.private_one.id
}
output "sub-private_two_id" {
    value = aws_subnet.private_two.id
}
output "eip_id" {
    value = aws_eip.elastic_ip.id
}
output "gateway_id" {
    value = aws_internet_gateway.gw.id
}
output "nat_gateway_id" {
    value = aws_nat_gateway.nat.id
}
output "public_route_table_id" {
    value = aws_route_table.public_table.id
}
output "private_route_table_id" {
    value = aws_route_table.private_table.id
}
