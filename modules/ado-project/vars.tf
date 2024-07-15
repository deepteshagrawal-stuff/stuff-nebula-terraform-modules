variable ado_project {
    type = map(object({
        projectName        = string
        projectDescription = string
        visibility         = string
        versionControl     = string
        workItemTemplate   = string
        
        features = object({
            boards    = bool
            repos     = bool
            pipelines = bool
            testPlans = bool
            artifacts = bool
            wiki      = bool
        })
    }))
    default = {}
}