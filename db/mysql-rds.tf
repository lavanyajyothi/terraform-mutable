resource "aws_db_instance" "default" {
  allocated_storage    = 10
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  name                 = "dummy"
  username             = "admin"
  password             = "admmin123"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
}

resource "aws_db_parameter_group" "default" {
  name   = "mysql-$(var.ENV)
  "
  family = "mysql5.7"

}

resource "aws_db_subnet_group" "subnet-group" {
  name       = "main"
  subnet_ids = [aws_subnet.frontend.id, aws_subnet.backend.id]

  tags = {
    Name = "My DB subnet group"
  }
}