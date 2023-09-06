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
      }
    }

    dynamic "backend" { 
      for_each              = var.ssl_backend
      content {                  
        name                = ssl_backend.value["name"]
        address             = ssl_backend.value["address"]
        override_host       = ssl_backend.value["address"]
        ssl_sni_hostname    = ssl_backend.value["address"]
        ssl_cert_hostname   = ssl_backend.value["address"]
        use_ssl             = ssl_backend.value["ssl"]
        port                = ssl_backend.value["port"]
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