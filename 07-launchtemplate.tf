# Data source for the Amazon Linux AMI
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

resource "aws_launch_template" "app1_lt" {
  name_prefix    = "pipeline-plumbers-lt"
  instance_type  = "t2.micro"
  image_id       = data.aws_ami.amazon_linux.id

  network_interfaces {
    associate_public_ip_address = false
    security_groups             = [aws_security_group.all_internal_traffic.id]
  }

  tags = {
    Name = "pipeline-plumbers-launch-template"
  }
}
