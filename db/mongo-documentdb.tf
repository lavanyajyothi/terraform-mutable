resource "aws_docdb_cluster" "docdb" {
  cluster_identifier      = "mongodb-${var.ENV}"
  engine                  = "docdb"
  engine_version          = "4.0.0"
  master_username         = local.ssh_user
  master_password         = local.ssh_pass
  skip_final_snapshot     = true
}





