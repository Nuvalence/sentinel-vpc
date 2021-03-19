## Create one NAT Gateway for the
## entire VPC / all subnets

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat_gateway_eip.id
  subnet_id     = aws_subnet.public.id
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_route" "nat" {
  route_table_id         = var.route_table_id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat.id
}
