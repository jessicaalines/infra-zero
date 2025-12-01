resource "aws_vpc" "dev" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "Homologação"
    Cost-Center = "31A"
    Project = "Infra-Zero"
    Owner = "Jessica Oliveira"
    Department = "Technology"

  }
}