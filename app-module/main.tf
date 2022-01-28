resource "aws_spot_instance_request" "spot" {
  count                = var.SPOT_INSTANCE_COUNT
  ami                  = data.aws_ami.ami.id
  instance_type        = var.INSTANCE_TYPE
  subnet_id            = element(data.terraform_remote_state.vpc.outputs.PRIVATE_SUBNETS_IDS, count.index)
  wait_for_fulfillment = true
}

resource "aws_instance" "od" {
  count                = var.OD_INSTANCE_COUNT
  ami                  = data.aws_ami.ami.id
  instance_type        = var.INSTANCE_TYPE
  subnet_id            = element(data.terraform_remote_state.vpc.outputs.PRIVATE_SUBNETS_IDS, count.index)

}

locals {
  INSTANCE_IDS     = concat(aws_spot_instance_request.spot.*.spot_instance_id, aws_instance.od.*.id)
}

output "INSTANCE_IDS" {
  value = local.INSTANCE_IDS
}
