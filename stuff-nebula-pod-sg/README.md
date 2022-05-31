# stuff-nebula-rds-sg-module
***This module is used to generate a security group that can be attached to your deployment.*** The generated security group is attached to the deployment using a sg-policy.yaml. This action allows your deployment to have unique networking configuration from that of the rest of the cluster. Such as allowing just you're deployment the ability to reach a RDS instance.

An example of the sg-policy.yaml that is deployed after generating the security group can be found here: https://github.com/StuffNZ/stuff-nebula-k8s-templates

`This module generates a security group with outbound all and inbound from node_security_group.` If you want to add inbound rules to this security group you can do so using the example ingress rules shown below. However if you want your pod security group to be able to reach something such as an RDS because the pod security group has outbound all adding this security group id as an allowed inbound sg_id to the rds sg will facilitate such communication.

## **Variables**
To use the following module you will have to declare the following variables during implementation.
Variable | Description | Default
---------------|--------------------------------------------------------|---------------
service_name | Name of the service to be attached to the pod security group name | null
sg_node_id | ID of the node security group | null
vpc_id | ID of the VPC that the security group is to be generated in | null

## **Example Implementation**
`Module implementation example:` 
```hcl
module "app_security_group" {
  source       = "github.com/StuffNZ/stuff-nebula-terraform-modules//stuff-nebula-pod-sg"
  vpc_id       = var.vpc_id
  sg_node_id   = var.sg_node_id
  service_name = var.name
}
```
`Attaching further inbound rules example - using sg generated from example module implementation:`
```hcl
resource "aws_security_group_rule" "example_rule_name" {
  type              = "ingress"
  from_port         = 0
  to_port           = 65535
  protocol          = "tcp"
  cidr_blocks       = [aws_vpc.example.cidr_block]
  security_group_id = module.app_security_group.id
}
```