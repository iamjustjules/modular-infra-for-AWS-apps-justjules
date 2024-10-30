resource "aws_key_pair" "pipeline_plumbers_key" {
  key_name   = "pipeline-plumbers-key"
  public_key = file("~/.ssh/id_rsa.pub")

  tags = {
    Name = "pipeline-plumbers-key"
  }
}

