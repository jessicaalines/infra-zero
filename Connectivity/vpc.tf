resource "aws_vpc" "dev" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = var.instance_tenancy

  tags = var.common_tags
}


