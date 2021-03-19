## Create one EIP to be used by the single
## NAT Gateway for the entire VPC / all subnets

resource "aws_eip" "nat_gateway_eip" {
  vpc = true

  tags = {
    Name = "sentinel"
  }

  lifecycle {
    create_before_destroy = true
  }

}
