resource "aws_autoscaling_group" "app1_asg" {
  name                 = "pipeline-plumbers-asg"
  min_size             = 3
  max_size             = 15
  desired_capacity     = 6
  vpc_zone_identifier  = [
    aws_subnet.private_us_east_1a.id,
    aws_subnet.private_us_east_1b.id,
    aws_subnet.private_us_east_1c.id,
  ]
  health_check_type    = "ELB"
  health_check_grace_period = 300
  target_group_arns    = [aws_lb_target_group.app1_tg.arn]

  launch_template {
    id      = aws_launch_template.app1_lt.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "pipeline-plumbers-instance"
    propagate_at_launch = true
  }
}
