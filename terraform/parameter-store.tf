
resource "aws_ssm_parameter" "rds" {
  name  = "rds_endpoint"
  type  = "SecureString"
  value = aws_db_instance.mydb.address
}

resource "aws_ssm_parameter" "elasticahe" {
  name  = "elasticahe-address"
  type  = "SecureString"
  value =  aws_elasticache_replication_group.single-node.primary_endpoint_address
}
data "aws_ssm_parameter" "username_rds" {
  name = "username_rds"
}

