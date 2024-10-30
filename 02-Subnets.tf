# Public Subnets
resource "aws_subnet" "public_us_east_1a" {
  vpc_id                  = aws_vpc.pipeline_plumbers_vpc.id
  cidr_block              = "10.100.11.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name     = "pipeline-plumbers-public-us-east-1a"
    Service  = "application"
    Owner    = "pipeline-plumbers"
    Location = "The-pipelines"
  }
}

resource "aws_subnet" "public_us_east_1b" {
  vpc_id                  = aws_vpc.pipeline_plumbers_vpc.id
  cidr_block              = "10.100.12.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name     = "pipeline-plumbers-public-us-east-1b"
    Service  = "application"
    Owner    = "pipeline-plumbers"
    Location = "The-pipelines"
  }
}

resource "aws_subnet" "public_us_east_1c" {
  vpc_id                  = aws_vpc.pipeline_plumbers_vpc.id
  cidr_block              = "10.100.13.0/24"
  availability_zone       = "us-east-1c"
  map_public_ip_on_launch = true

  tags = {
    Name     = "pipeline-plumbers-public-us-east-1c"
    Service  = "application"
    Owner    = "pipeline-plumbers"
    Location = "The-pipelines"
  }
}

# Private Subnets - Updated CIDR Blocks
resource "aws_subnet" "private_us_east_1a" {
  vpc_id            = aws_vpc.pipeline_plumbers_vpc.id
  cidr_block        = "10.100.111.0/24"  # Corrected to fall within 10.101.0.0/16
  availability_zone = "us-east-1a"

  tags = {
    Name     = "pipeline-plumbers-private-us-east-1a"
    Service  = "application"
    Owner    = "pipeline-plumbers"
    Location = "The-pipelines"
  }
}

resource "aws_subnet" "private_us_east_1b" {
  vpc_id            = aws_vpc.pipeline_plumbers_vpc.id
  cidr_block        = "10.100.112.0/24"  # Corrected to fall within 10.101.0.0/16
  availability_zone = "us-east-1b"

  tags = {
    Name     = "pipeline-plumbers-private-us-east-1b"
    Service  = "application"
    Owner    = "pipeline-plumbers"
    Location = "The-pipelines"
  }
}

resource "aws_subnet" "private_us_east_1c" {
  vpc_id            = aws_vpc.pipeline_plumbers_vpc.id
  cidr_block        = "10.100.113.0/24"  # Corrected to fall within 10.101.0.0/16
  availability_zone = "us-east-1c"

  tags = {
    Name     = "pipeline-plumbers-private-us-east-1c"
    Service  = "application"
    Owner    = "pipeline-plumbers"
    Location = "The-pipelines"
  }
}