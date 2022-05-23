
resource "aws_ssm_parameter" "rds" {
  name  = "rds_endpoint"
  type  = "SecureString"
  value = aws_db_instance.mydb.address
}

# resource "aws_ssm_parameter" "elasticahe" {
#   name  = "elasticahe"
#   type  = "SecureString"
#   value = aws_elasticache_cluster.cache_cluster.cluster_address
# }
