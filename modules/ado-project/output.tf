output "ado_project_id" {
    description = "Id of Azure DevOps projects"
    value = values(azuredevops_project.ado_project)[*].id
}