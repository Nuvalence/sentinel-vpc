#module "use1-dhcp" {
#  source = "./modules/dhcp_options/"
#  providers = {
#    aws = aws.use1
#  }
#  domain_name         = "sentinel.net"
#  domain_name_servers = module.use1-r53.domain_name_servers
#  vpc_id              = module.use1-vpc.vpc_id
#}
#
#module "use2-dhcp" {
#  source = "./modules/dhcp_options/"
#  providers = {
#    aws = aws.use2
#  }
#  domain_name         = "sentinel.net"
#  domain_name_servers = module.use2-r53.domain_name_servers
#  vpc_id              = module.use2-vpc.vpc_id
#}

module "usw1-dhcp" {
  source = "./modules/dhcp_options/"
  providers = {
    aws = aws.usw1
  }
  domain_name         = "sentinel.net"
  domain_name_servers = module.usw1-r53.domain_name_servers
  vpc_id              = module.usw1-vpc.vpc_id
}
