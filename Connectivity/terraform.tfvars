vpc_cidr         = "10.0.0.0/16"
instance_tenancy = "default"

common_tags = {
  Name = "Homologação"
  Project     = "Infra-Zero"
  Owner       = "Jessica Oliveira"
  Department  = "Technology"
  Cost-Center = "31A"
}

public_subnet_config = {
  name   = "app_subnet_public"
  cidr   = "10.0.3.0/24"
  az     = "us-east-1c"
  public = true
  tier   = "public"
}

private_subnets = {
  dmz = {
    name   = "dmz-subnet-private"
    cidr   = "10.0.1.0/24"
    az     = "us-east-1a"
    public = false
    tier   = "private"
  }
  bd = {
    name   = "bd-subnet-private"
    cidr   = "10.0.2.0/24"
    az     = "us-east-1b"
    public = false
    tier   = "private"
  }
}