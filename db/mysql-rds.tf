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
  name       = "mysqldb-subnet-group-$(var.ENV)"
  subnet_ids = data.terraform_remote_state.vpc.outputs.PRIVATE_SUBNETTS_IDS

  tags = {
    Name = "mysqldb-subnet-group-$(var.ENV)"
  }
}