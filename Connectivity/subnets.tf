#Subnets DMZ e BD privadas
locals {
  private_subnets = {
    dmz = {
      name = "dmz-subnet-private"
      index = 0
    }
    bd = {
      name = "bd-subnet-private"
      index = 1
    }
  }
}

resource "aws_subnet" "dzm_bd_private_subnet" {
 for_each = local.private_subnets

  vpc_id     = aws_vpc.dev.id
  cidr_block = cidrsubnet(aws_vpc.dev.cidr_block, 8, each.value.index + 1) #primeira e segunda subnet da VPC
  availability_zone = data.aws_availability_zones.available.names[each.value.index]
  map_public_ip_on_launch = false

  tags = {
    Name = each.value.name
    Tier = "private"
  }
}

#Subnet App pública
resource "aws_subnet" "app_public" {
  vpc_id     = aws_vpc.dev.id
  cidr_block = cidrsubnet(aws_vpc.dev.cidr_block, 8, 3) #terceira subnet da VPC
  availability_zone = data.aws_availability_zones.available.names[2]
  map_public_ip_on_launch = true

  tags = {
    Name = "app_subnet_public"
    Tier = "public"
  }
}


