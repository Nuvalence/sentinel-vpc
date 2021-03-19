# 172.17. is the default docker space, skipping that
# 172.31. was also provisioned in use1 in deprecated 'default' vpc
locals {
  cidr_blocks = {
    us-east-1 = "172.18.0.0/16"
    us-east-2 = "172.19.0.0/16"
    us-west-1 = "172.20.0.0/16"
  }

  private_scopes = {
    us-east-1 = "172.18.0.0/20"
    us-east-2 = "172.19.0.0/20"
    us-west-1 = "172.20.0.0/20"
  }

  # Leave room for the full 172.b.192.0/20 
  failover_scopes = {
    us-east-1 = "172.18.208.0/20"
    us-east-2 = "172.19.208.0/20"
    us-west-1 = "172.20.208.0/20"
  }

  public_scopes = {
    us-east-1 = "172.18.254.0/24"
    us-east-2 = "172.19.254.0/24"
    us-west-1 = "172.20.254.0/24"
  }
}
