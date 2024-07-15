terraform {
    required_providers {
        azuredevops = {
            source = "microsoft/azuredevops"
            version = ">= 0.1.0"
        }
    }
}


resource "azuredevops_build_definition" "ado_build_definition" {
        for_each = try(var.ado_build_definition, {})

    project_id      = var.projectId
    name            = each.value.buildName
    path            = each.value.path

    ci_trigger {
        use_yaml    = each.value.ci_trigger.use_yaml
    }

    repository {
        repo_type               = each.value.repository.repo_type
        repo_id                 = each.value.repository.repo_id
        branch_name             = each.value.repository.branch_name
        yml_path                = each.value.repository.yml_path
        service_connection_id   = each.value.repository.service_connection_id
    }

    features {
        skip_first_run = each.value.features.skip_first_run
    }
}
