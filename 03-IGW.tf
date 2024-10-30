resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.pipeline_plumbers_vpc.id

  tags = {
    Name     = "pipeline-plumbers-IGW"
    Service  = "application"
    Owner    = "pipeline-plumbers"
    Location = "The-pipelines"
  }
}
