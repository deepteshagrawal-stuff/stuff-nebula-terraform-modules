variable ado_project {
    type = map(object({
        projectName        = string
        projectDescription = string
        visibility         = string
        versionControl     = string
        workItemTemplate   = string
        
        features = object({
            boards          = string
            repositories    = string
            pipelines       = string
            testPlans       = string
            artifacts       = string
        })
    }))
    default = {}
}