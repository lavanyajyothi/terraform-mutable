data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "terraform-badri60"
    key    = "terraform-mutable/vpc/${var.ENV}/terraform.tfstate"
    region = "us-east-1"
  }
}

data "aws_secretsmanager_secret" "secrets" {
  name  = var.ENV
}


data "aws_secretsmanager_secret_version" "secrets-version" {
  secret_id = data.aws_secretsmanager_secret.secrets.id
}

resource "aws__spot_instance_request"  "mongodb" {
  ami = ""
  instance_type  = ""
  vpc_security_group-ids =  [aws_security_group.mongodb.id]
}

