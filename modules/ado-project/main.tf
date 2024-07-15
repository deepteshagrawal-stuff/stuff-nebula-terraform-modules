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
        repos = each.value.features.repos
        pipelines = each.value.features.pipelines
        testPlans = each.value.features.testPlans
        artifacts = each.value.features.artifacts
        wiki = each.value.features.wiki
    }

}