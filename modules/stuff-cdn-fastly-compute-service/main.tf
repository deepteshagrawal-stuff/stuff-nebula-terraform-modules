data "fastly_package_hash" "package" {
  filename                  = var.package
}

resource "fastly_service_compute" "compute_service" {

    name                    = var.name
    activate                = var.activate

    dynamic "backend" { 
      for_each              = var.backend
      content {                  
        name                = backend.value["name"]
        address             = backend.value["address"]
        override_host       = backend.value["address"]
        port                = backend.value["port"]
        ssl_sni_hostname    = backend.value["ssl_sni_hostname"]
        ssl_cert_hostname   = backend.value["ssl_cert_hostname"]
        use_ssl             = backend.value["use_ssl"]
      }
    }

    dynamic "backend" { 
      for_each              = var.one_login ? [1] : []
      content {                  
        name                = "idp"
        address             = "stuff.onelogin.com"
        override_host       = "stuff.onelogin.com"
        ssl_sni_hostname    = "stuff.onelogin.com"
        ssl_cert_hostname   = "stuff.onelogin.com"
        port                = 443
        use_ssl             = true
      }
    }

    dynamic "domain" { 
      for_each              = var.domain
      content {                  
        name                = domain.value["name"]
      }
    }

    package {
        filename            = var.package
        source_code_hash    = data.fastly_package_hash.package.hash
    }

    dynamic "resource_link" { 
      for_each              = var.resource_link
      content {                  
        name                = resource_link.value["name"]
        resource_id         = resource_link.value["resource_id"]
      }
    }
}