
resource "aws_lb_target_group" "app1_tg" {
  name     = "pipeline-plumbers-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.pipeline_plumbers_vpc.id

  health_check {
    path                = "/"
    protocol            = "HTTP"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 3
    unhealthy_threshold = 3
  }

  tags = {
    Name = "pipeline-plumbers-target-group"
  }
}
