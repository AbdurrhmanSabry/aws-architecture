resource "aws_instance" "bastion-ec2" {
  ami = var.ami
  instance_type = var.instance_type
  key_name = "${var.region}key"
  vpc_security_group_ids = [aws_security_group.Bastion.id]
  subnet_id = module.network.sub-public_one_id
  # root_block_device {
  #         delete_on_termination = true 
  #         encrypted             = false 
  #         volume_size           = 20
  #         volume_type           = "gp2"
  #       }
  tags = {
    Name = "bastion"
  }
  provisioner "local-exec" {
    # command = "echo  ${self.availability_zone} >> bastion_public_ips.txt"
    command = "sed -i 's/.*ansible_host.*/ansible_host: ${self.public_ip}/' ./ansible/group_vars/proxy.yaml"
  }
}

resource "aws_instance" "application" {
  ami = var.ami
  instance_type = var.instance_type
  key_name = "${var.region}key"
  vpc_security_group_ids = [aws_security_group.PrivateSec.id]
  subnet_id = module.network.sub-private_one_id
  # root_block_device {
  #         delete_on_termination = true 
  #         encrypted             = false 
  #         volume_size           = 20 
  #         volume_type           = "gp2"
  #       }

  provisioner "local-exec" {
    command = "sed -i 's/.*ansible_host.*/ansible_host: ${self.private_ip}/' ./ansible/group_vars/slaves.yaml"
  }
  tags = {
    Name = "application"
  }
}

# resource "aws_instance" "instane_logs" {
#   ami = var.ami
#   instance_type = var.instance_type
#   key_name = "${var.region}key"
#   vpc_security_group_ids = [aws_security_group.Bastion.id]
#   subnet_id = module.network.sub-public_two_id
#   root_block_device {
#           delete_on_termination = true 
#           encrypted             = false 
#           volume_size           = 20 
#           volume_type           = "gp2"
#         }
#   tags = {
#     Name = "instane_logs"
#   }
# }