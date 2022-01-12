data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "terraform-badri60"
    key    = "terraform-mutable/db/dev/terraform.tfstate"
    region = "us-east-1"
  }
}

