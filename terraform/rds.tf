resource "aws_db_instance" "mydb" {
  allocated_storage    = 10
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  username             = "admin"
  password             = "admin123456789"
  parameter_group_name = "default.mysql5.7"
  db_subnet_group_name = aws_db_subnet_group.mydb_sub_group.name
  skip_final_snapshot  = true
  vpc_security_group_ids = [aws_security_group.rds-sg.id]
}

resource "aws_db_subnet_group" "mydb_sub_group" {
  subnet_ids = [module.network.sub-private_one_id , module.network.sub-private_two_id]

  tags = {
    Name = "DB_subnet_group"
  }
}
