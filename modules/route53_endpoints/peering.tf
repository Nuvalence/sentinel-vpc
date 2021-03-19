##  A provider for remote peering acceptance
provider "aws" {
  alias  = "accepter"
  region = var.accepter_region
}

##  Route53 needs to be presented on each vpc 

##  Regional endpoints
resource "aws_route53_resolver_endpoint" "sentinel" {
  provider = aws.accepter
  name = "sentinel-${var.accepter_region}"
  direction = "INBOUND"
  security_group_ids = [ aws_security_group.vpc_peers.id ]
  ip_address {
    subnet_id = var.route53_private_subnet_id
  }
  ip_address {
    subnet_id = var.route53_failover_subnet_id
  }
}

output "domain_name_servers" {
  value = [ 
    join(",",aws_route53_resolver_endpoint.sentinel.ip_address[*]["ip"])
  ]
}


##  Zone associations
##  SENTINEL.NET/prod
data "aws_route53_zone" "prod" {
  name = "sentinel.net."
  private_zone = true
}
resource "aws_route53_vpc_association_authorization" "prod" {
  vpc_id = var.accepter_vpc_id
  zone_id = data.aws_route53_zone.prod.id
}
resource "aws_route53_zone_association" "prod" {
  provider = aws.accepter
  vpc_id = aws_route53_vpc_association_authorization.prod.vpc_id
  zone_id = aws_route53_vpc_association_authorization.prod.zone_id
}

##  SBX.SENTINEL.NET/sbx
data "aws_route53_zone" "sbx" {
  name = "sbx.sentinel.net."
  private_zone = true
}
resource "aws_route53_vpc_association_authorization" "sbx" {
  vpc_id = var.accepter_vpc_id
  zone_id = data.aws_route53_zone.sbx.id
}
resource "aws_route53_zone_association" "sbx" {
  provider = aws.accepter
  vpc_id = aws_route53_vpc_association_authorization.sbx.vpc_id
  zone_id = aws_route53_vpc_association_authorization.sbx.zone_id
}

##  STAGE.SENTINEL.NET/stage
data "aws_route53_zone" "stage" {
  name = "stage.sentinel.net."
  private_zone = true
}
resource "aws_route53_vpc_association_authorization" "stage" {
  vpc_id = var.accepter_vpc_id
  zone_id = data.aws_route53_zone.stage.id
}
resource "aws_route53_zone_association" "stage" {
  provider = aws.accepter
  vpc_id = aws_route53_vpc_association_authorization.stage.vpc_id
  zone_id = aws_route53_vpc_association_authorization.stage.zone_id
}
