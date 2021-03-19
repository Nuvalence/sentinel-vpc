###  Regional VPC Deployment 

All regions[1] are deployed via this repository. This terraform should be run **manually** as phase **2** of vpc bootstrap. There is _**no**_ ci configuration for this repository. 
  
[1] See [Notes](#-notes) for info about legacy vpc. 

---
1. [Components](#1-components)
2. [Procedure](2-procedure)
3. [Scope](#3-scope)
4. [Notes](#4-notes)

1) Components
- VPC container
- Subnets
  - private /22 => zone 'A'
  - failover /22 => azone 'C'
  - public /24 => zone' A'
  - public failover /24 zone 'C'
- Internet gateway
- Nat gateways in zones 'A' and 'C'
- Elastic ip's for gateways
- VPC peering connections and dedicated security group
- Route tables
- Route53 endpoints
- DHCP option sets

2) Procedure
```
$ terraform init -upgrade
$ terraform plan -out tf.plan
$ terraform apply tf.plan
$ rm tf.plan
```

3) Scope

- Production - US-EAST-1
- Staging - US-EAST-2
- Sandbox - US-WEST-1


4) Notes
- While there is remote state due to the instantiation of buckets in the previous bootstrap stage, there is no state lock as the table has not been created yet. 
