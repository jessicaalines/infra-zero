resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.dev.id

  tags = merge(var.common_tags, {
    Name = "igw-infra-zero"
  })
}