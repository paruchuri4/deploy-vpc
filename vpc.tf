#  Create VPC
resource "aws_vpc" "dev-vpc" {
  cidr_block           = var.vpc_cidr_block
  instance_tenancy     = "default"
  enable_dns_hostnames = true #gives you an internal fully qualified host name


  tags = {
    Name = var.vpc_name
  }
}
