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

resource  "local_file" "foo" {
  content  = jsondecode(data.aws_secretsmanager_secret_version.secrets-version.secret_string)["RDS_MYSQL_USER"]
  filename = "/tmp/1"
}

