
resource "aws_lb" "app1_lb" {
  name               = "pipeline-plumbers-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.all_internal_traffic.id]
  subnets            = [
    aws_subnet.public_us_east_1a.id,
    aws_subnet.public_us_east_1b.id,
    aws_subnet.public_us_east_1c.id,
  ]

  tags = {
    Name = "pipeline-plumbers-lb"
  }
}

resource "aws_lb_listener" "app1_listener" {
  load_balancer_arn = aws_lb.app1_lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app1_tg.arn
  }
}
