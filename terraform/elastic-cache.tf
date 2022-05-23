# resource "aws_elasticache_cluster" "cache_cluster" {
#   cluster_id           = "redis-cluster"
#   engine               = "redis"
#   node_type            = "cache.t2.micro"
#   num_cache_nodes      = 1
#   engine_version       = "6.x"
#   port                 = 6379
#   security_group_ids = [aws_security_group.cache-sg.id]
#   subnet_group_name = aws_elasticache_subnet_group.cache-sub-grp.name
#   tags = {
#     Name = "redis-cluster"
#   }
# }

resource "aws_elasticache_subnet_group" "cache-sub-grp" {
  name       = "cache-subnet-group"
  subnet_ids = [module.network.sub-private_one_id, module.network.sub-private_two_id]
  tags = {
    Name = "cache-subnet-group"
  }
}
resource "aws_elasticache_replication_group" "single-node" {
  automatic_failover_enabled  = true
  preferred_cache_cluster_azs = ["${var.region}a", "${var.region}b"]
  replication_group_id        = "tf-rep-1"
  description                 = "create  elastic cache replication"
  node_type                   = "cache.t2.micro"
  num_cache_clusters       = 2
  engine_version       = "6.x"
  port                        = 6379
  subnet_group_name = aws_elasticache_subnet_group.cache-sub-grp.name
  security_group_ids = [aws_security_group.cache-sg.id]
}