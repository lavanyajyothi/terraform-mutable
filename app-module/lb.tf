resource "aws_lb_target_group" "tg" {
  name     = local.tags["Name"]
  port     = var.PORT
  protocol = "HTTP"
  vpc_id   = data.terraform_remote_state.vpc.outputs.VPC_ID

}

resource "aws_lb_target_group_attachment" "tg-attach" {
  count            = length(local.INSTANCE_IDS)
  target_group_arn = aws_lb_target_group.tg.arn
  target_id        = element(local.INSTANCE_IDS, count.index)
  port             = var.PORT
}

resource "aws_lb_listener_rule" "private" {
  count        = var.IS_PRIVATE_LB ? 1 : 0
  listener_arn = data.terraform_remote_state.alb.outputs.PRIVATE_LISTENER_ARN
  priority     = var.LB_RULE_PRIORITY

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }

  condition {
    host_header {
      values = ["${var.COMPONENT}-${var.ENV}.roboshop.internal"]
    }
  }
}
