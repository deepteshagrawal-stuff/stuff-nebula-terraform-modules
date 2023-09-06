data "fastly_package_hash" "package" {
  filename                  = var.package
}

resource "fastly_service_compute" "compute_service" {

    name                    = var.name
    activate                = var.activate

    dynamic "backend" { 
      for_each              = var.backends
      content {                  
        name                = backends.value["name"]
        address             = backends.value["address"]
        override_host       = backends.value["address"]
        port                = backends.value["port"]
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
      for_each              = var.domains
      content {                  
        name                = domains.value["name"]
      }
    }

    package {
        filename            = var.package
        source_code_hash    = data.fastly_package_hash.package.hash
    }

    dynamic "resource_link" { 
      for_each              = var.resource_links
      content {                  
        name                = resource_links.value["name"]
        resource_id         = resource_links.value["resource_id"]
      }
    }
}