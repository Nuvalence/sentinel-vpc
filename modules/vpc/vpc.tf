variable "cidr_block" {}

resource "aws_vpc" "sentinel" {
  cidr_block           = var.cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "sentinel"
  }
}

resource "aws_default_route_table" "sentinel" {
  default_route_table_id = aws_vpc.sentinel.default_route_table_id
  tags = {
    Name    = "sentinel",
    private = "true",
    public  = "false"
  }
}

output "vpc_id" {
  value = aws_vpc.sentinel.id
}

output "route_table_id" {
  value = aws_default_route_table.sentinel.id
}
