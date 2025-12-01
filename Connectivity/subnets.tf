#Subnets DMZ e BD privadas
resource "aws_subnet" "dzm_bd_private_subnet" {
  count = 2
  vpc_id     = aws_vpc.dev.id
  cidr_block = cidrsubnet(aws_vpc.dev.cidr_block, 8, count.index + 1) #primeira e segunda subnet da VPC
  availability_zone = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = false

  tags = {
    Name = count.index == 0 ? "dmz_subnet_private" : "bd_subnet_private"
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


