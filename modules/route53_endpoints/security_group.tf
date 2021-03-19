resource "aws_security_group" "vpc_peers" {
  provider = aws.accepter
  name                   = "vpc_peers"
  description            = "allow full communication between vpc peers"
  vpc_id      = var.accepter_vpc_id 
  tags                   = {
    Name    = "vpc-peers"
    include = true
  }

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks   = [ "172.16.0.0/12" ]
  }

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks   = [ "172.16.0.0/12" ]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks   = [ "172.16.0.0/12" ]
  }
}
