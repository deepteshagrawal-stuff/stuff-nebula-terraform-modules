terraform {
    required_providers {
        azuredevops = {
            source = "microsoft/azuredevops"
            version = ">= 0.1.0"
        }
    }
}

resource "azuredevops_project" "ado_project" {
        for_each = try(var.ado_project, {})

    name                = each.value.projectName
    visibility          = each.value.visibility
    version_control     = each.value.versionControl
    work_item_template  = each.value.workItemTemplate
    description         = each.value.projectDescription
    features = {
        boards = each.value.features.boards
        repositories = each.value.features.repositories
        pipelines = each.value.features.pipelines
        testplans = each.value.features.testplans
        artifacts = each.value.features.artifacts
    }

}