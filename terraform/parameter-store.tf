
resource "aws_ssm_parameter" "rds" {
  name  = "/${var.name_environment}/rdsdatabase/address"
  type  = "SecureString"
  value = aws_db_instance.mydb.address
}

resource "aws_ssm_parameter" "elasticahe" {
  name  = "/${var.name_environment}/elasticaheredis/address"
  type  = "SecureString"
  value =  aws_elasticache_replication_group.single-node.primary_endpoint_address
}
data "aws_ssm_parameter" "username_rds" {
  name = "username_rds"
}
data "aws_ssm_parameter" "password_rds" {
  name = "password_rds"
  with_decryption = true
}


