module "pod_security_group" {
  source       = "github.com/StuffNZ/stuff-nebula-terraform-modules//stuff-nebula-pod-sg"
  vpc_id       = var.vpc_id
  sg_node_id   = var.sg_node_id
  service_name = var.name
}