data "aws_region" "default" {}

##  Private subnet /22
##  All of our regions have an az 'a'
resource "aws_subnet" "private" {
  vpc_id                  = var.vpc_id
  availability_zone       = "${data.aws_region.default.name}a"
  cidr_block              = var.private_scope
  map_public_ip_on_launch = false

  tags = {
    Name = "${data.aws_region.default.name}a-${var.private_scope}"
    tier = "private"
  }
}

##  Failover subnet /22
##  All of our regions have an az 'c'
resource "aws_subnet" "failover" {
  vpc_id                  = var.vpc_id
  availability_zone       = "${data.aws_region.default.name}c"
  cidr_block              = var.failover_scope
  map_public_ip_on_launch = false

  tags = {
    Name = "${data.aws_region.default.name}a-${var.failover_scope}"
    tier = "failover"
  }
}

resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.private.id
  route_table_id = var.route_table_id
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_route_table_association" "failover" {
  subnet_id      = aws_subnet.failover.id
  route_table_id = var.route_table_id
  lifecycle {
    create_before_destroy = true
  }
}

##  Public subnet /24
##  All of our regions have an az 'a'
resource "aws_subnet" "public" {
  vpc_id                  = var.vpc_id
  availability_zone       = "${data.aws_region.default.name}a"
  cidr_block              = var.public_scope
  map_public_ip_on_launch = true

  tags = {
    Name = "${data.aws_region.default.name}a-${var.public_scope}"
    tier = "public"
  }
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
  lifecycle {
    create_before_destroy = true
  }
}

output "failover_subnet_id" {
  value = aws_subnet.failover.id
}

output "private_subnet_id" {
  value = aws_subnet.private.id
}
