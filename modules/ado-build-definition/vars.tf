variable ado_build_definition {
    type = map(object({
        buildName = string
        path = string
        ci_trigger = object({
            use_yaml = bool
        })
        repository = object({
            repo_type = string
            repo_id = string
            branch_name = string
            yml_path = string
            service_connection_id = string
        })
        features = object({
            skip_first_run = bool
        })
    }))
}

variable projectId {
    type = string
}

variable repo_id {
    type = string
}