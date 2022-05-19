output "vpc_id" {
    value = module.network.vpc_id
}
output "public_one_id" {
  value = module.network.sub-public_one_id
}
output "public_two_id" {
    value =  module.network.sub-public_two_id
}
output "private_one_id" {
    value = module.network.sub-private_one_id
}
output "private_two_id" {
    value = module.network.sub-private_two_id
}
output "eip_id" {
    value = module.network.eip_id
}
output "gateway_id" {
    value = module.network.gateway_id
}
output "nat_gateway_id" {
    value = module.network.nat_gateway_id
}
output "public_route_table_id" {
    value = module.network.public_route_table_id
}
output "private_route_table_id" {
    value = module.network.private_route_table_id
}
# output "public_key" {
#     value = tls_private_key.private_key_pair
#     sensitive = true
# }
# output "pem_secret_id" {
#     value = aws_secretsmanager_secret.private_key.id
#     sensitive = true
# }
# output "pem_secret_string" {
#     value = tls_private_key.private_key_pair.private_key_pem
#     sensitive = true
# }

# output "pub_secret_id" {
#     value = aws_secretsmanager_secret.public_key.id
#     sensitive = true
# }
# output "pub_secret_string" {
#     value =  aws_key_pair.public_key_pair.public_key
#     sensitive = true
# }
output "bastion_sq" {
    value = aws_security_group.Bastion.id
}
# output "key_name" {
#     value = aws_key_pair.public_key_pair.key_name
# }
output "application_sq" {
    value = aws_security_group.PrivateSec.id
}

output "puplic-ip-ec2" {
  value = aws_instance.application.public_ip
}
output "name" {
  value = aws_instance.bastion-ec2.private_ip
}