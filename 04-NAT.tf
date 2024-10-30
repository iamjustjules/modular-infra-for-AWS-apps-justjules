resource "aws_eip" "nat" {
  vpc = true
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public_us_east_1a.id  # Reference updated subnet ID

  tags = {
    Name = "pipeline-plumbers-NAT"
  }

  depends_on = [aws_internet_gateway.igw]
}