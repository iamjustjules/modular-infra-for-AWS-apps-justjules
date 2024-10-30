resource "aws_vpc" "pipeline_plumbers_vpc" {
  cidr_block = "10.100.0.0/16"

  tags = {
    Name     = "pipeline-plumbers-VPC"
    Service  = "pipeline-plumbers"
    Owner    = "pipeline-plumbers"
    Location = "The-pipelines"
  }
}