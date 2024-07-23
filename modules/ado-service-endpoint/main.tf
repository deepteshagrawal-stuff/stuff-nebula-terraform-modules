terraform {
    required_providers {
        azuredevops = {
            source = "microsoft/azuredevops"
            version = ">= 0.1.0"
        }
    }
}

resource "azuredevops_serviceendpoint_github" "ado_service_endpoint" {
    for_each = try(var.ado_service_endpoint, {})

  project_id            = var.projectId
  service_endpoint_name = each.value.service_endpoint_name
  # Note Github Apps do not support a description and will always be empty string. Must be explicitly set to override the default value.  
  description = each.value.description

}