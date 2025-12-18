# Subnets Privadas (DMZ e BD)
resource "aws_subnet" "dzm_bd_private_subnet" {
  for_each = var.private_subnets

  vpc_id                  = aws_vpc.dev.id
  cidr_block              = each.value.cidr
  availability_zone       = each.value.az
  map_public_ip_on_launch = each.value.public

  tags = merge(var.common_tags, {
    Name = each.value.name
    Tier = each.value.tier
  })
}

# Subnet App Pública
resource "aws_subnet" "app_public" {
  vpc_id                  = aws_vpc.dev.id
  cidr_block              = var.public_subnet_config.cidr
  availability_zone       = var.public_subnet_config.az
  map_public_ip_on_launch = var.public_subnet_config.public

  tags = merge(var.common_tags, {
    Name = var.public_subnet_config.name
    Tier = "public"
  })
}