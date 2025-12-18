# Tabela de rotas para a subnet pública
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.dev.id

  # Acesso ao Internet Gateway
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = merge(var.common_tags, {
    Name = "rt-${var.public_subnet_config.name}"
    Tier = var.public_subnet_config.tier
  })
}

# Tabelas de rotas para as subnets privadas
resource "aws_route_table" "private_rt" {
  for_each = var.private_subnets
  vpc_id   = aws_vpc.dev.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.main.id
  }

  tags = merge(var.common_tags, {
    Name = "rt-${each.value.name}"
    Tier = each.value.tier
  })
}

# Associações da tabela de rotas
# Associando a subnet pública à tabela de rotas
resource "aws_route_table_association" "public_assoc" {
  subnet_id      = aws_subnet.app_public.id
  route_table_id = aws_route_table.public_rt.id
}

# Associando cada subnet privada à tabela de rotas
resource "aws_route_table_association" "private_assoc" {
  for_each = var.private_subnets

  # Usando o 'each.key' para referenciar a subnet correta
  subnet_id      = aws_subnet.dzm_bd_private_subnet[each.key].id
  route_table_id = aws_route_table.private_rt[each.key].id
}