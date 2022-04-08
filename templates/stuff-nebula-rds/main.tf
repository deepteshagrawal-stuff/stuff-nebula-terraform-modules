module "app_rds" {
  source         = "github.com/StuffNZ/stuff-nebula-terraform-modules//stuff-nebula-rds"
  subnet_ids     = var.subnet_ids
  inbound_sg_ids = app_security_group.pod_sg.id #If you are not generating a POD security group you can change  this for a variable SG
  rds_object     = var.rds_object
}