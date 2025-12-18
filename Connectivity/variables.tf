variable "vpc_cidr" {
  type = string
}

variable "instance_tenancy" {
  type    = string
  default = "default"
}

variable "common_tags" {
  type = map(string)
}

variable "public_subnet_config" {
  type = object({
    name   = string
    cidr   = string
    az     = string
    public = bool
    tier   = string
  })
}

variable "private_subnets" {
  type = map(object({
    name   = string
    cidr   = string
    az     = string
    public = bool
    tier   = string
  }))
}