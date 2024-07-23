variable ado_service_endpoint {
    type = map(object({
        service_endpoint_name   = string
        description             = string
    }))
    default = {}
}

variable projectId {
    type = string
}
