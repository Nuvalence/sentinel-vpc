##  Module provider uses the primary region, ostensibly 'us-east-1'.
##  This primary region is the 'requester'. 
##  The remote (peer) region is the 'accepter'.

##  A provider for remote peering acceptance
provider "aws" {
  alias  = "accepter"
  region = var.accepter_region
}

##  VPC peering connection and remote accepter
resource "aws_vpc_peering_connection" "here" {
  vpc_id      = var.requester_vpc_id
  peer_vpc_id = var.accepter_vpc_id
  auto_accept = false
  peer_region = var.accepter_region
  tags = {
    Name = "${var.requester_region}:${var.accepter_region}"
  }
}
resource "aws_vpc_peering_connection_accepter" "here" {
  provider                  = aws.accepter
  vpc_peering_connection_id = aws_vpc_peering_connection.here.id
  auto_accept               = true
}

##  Route to accepter cidr
resource "aws_route" "requester" {
  route_table_id            = var.requester_route_table_id
  destination_cidr_block    = var.accepter_cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.here.id
}

##  Route to requester cidr
resource "aws_route" "accepter" {
  provider                  = aws.accepter
  route_table_id            = var.accepter_route_table_id
  destination_cidr_block    = var.requester_cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.here.id
}
