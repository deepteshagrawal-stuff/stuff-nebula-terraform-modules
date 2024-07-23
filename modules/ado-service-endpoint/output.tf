output "ado-service-endpoint" {
    description = "Service Endpoint"
    value = values(azuredevops_serviceendpoint_github.ado_service_endpoint)[*].id
}