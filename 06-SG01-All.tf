# Security Group allowing all traffic within VPC
resource "aws_security_group" "all_internal_traffic" {
  vpc_id = aws_vpc.pipeline_plumbers_vpc.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["10.100.0.0/16", "10.101.0.0/16"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "pipeline-plumbers-internal-traffic"
  }
}
