variable "domain_name" {}
variable "domain_name_servers" {}
variable "vpc_id" {}

resource "aws_vpc_dhcp_options" "sentinel" {
  domain_name = var.domain_name
  domain_name_servers = var.domain_name_servers
  tags = {
    Name = "sentinel"
  }
}

resource "aws_vpc_dhcp_options_association" "sentinel" {
  vpc_id  = var.vpc_id
  dhcp_options_id = aws_vpc_dhcp_options.sentinel.id
}
