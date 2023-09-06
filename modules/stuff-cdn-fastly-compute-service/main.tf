data "fastly_package_hash" "package" {
  filename                  = var.package
}


resource "akamai_property" "property" {
  name               = var.property_name
  product_id         = var.product_id
  contract_id        = data.akamai_contract.contract.id
  group_id           = data.akamai_group.group.id
  dynamic "hostnames" { 
      for_each = var.hostnames
      content {                  
        cname_from = hostnames.value["cname_from"]
        cname_to = hostnames.value["edge_hostname"]
        cert_provisioning_type = "CPS_MANAGED"
      }
  }
  rule_format = "v2023-01-05"
  rules = var.rules
}



resource "fastly_service_compute" "compute_service" {

    name                    = var.name
    activate                = var.activate

    dynamic "backend" { 
      for_each              = var.backend
      content {                  
        name                = hostnames.value["name"]
        address             = hostnames.value["address"]
        override_host       = hostnames.value["address"]
        port                = hostnames.value["port"]
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

    backend {
        name                = "idp"
        override_host       = "stuff.onelogin.com"
        address             = "stuff.onelogin.com"
        ssl_sni_hostname    = "stuff.onelogin.com"
        ssl_cert_hostname   = "stuff.onelogin.com"
        use_ssl             = true
        port                = 443
    }


    backend {
        name                = "app-dev-thepost"
        address             = "nz.co.thepost.dev-app.s3-website-ap-southeast-2.amazonaws.com"
        override_host       = "nz.co.thepost.dev-app.s3-website-ap-southeast-2.amazonaws.com"
        port                = 80
    }
    backend {
        name                = "app-dev-thepress"
        address             = "nz.co.thepress.dev-app.s3-website-ap-southeast-2.amazonaws.com"
        override_host       = "nz.co.thepress.dev-app.s3-website-ap-southeast-2.amazonaws.com"
        port                = 80
    }
    backend {
        name                = "app-dev-waikatotimes"
        address             = "nz.co.waikatotimes.dev-app.s3-website-ap-southeast-2.amazonaws.com"
        override_host       = "nz.co.waikatotimes.dev-app.s3-website-ap-southeast-2.amazonaws.com"
        port                = 80
    }
    backend {
        name                = "app-test-thepost"
        address             = "nz.co.thepost.test-app.s3-website-ap-southeast-2.amazonaws.com"
        override_host       = "nz.co.thepost.test-app.s3-website-ap-southeast-2.amazonaws.com"
        port                = 80
    }
    backend {
        name                = "app-test-thepress"
        address             = "nz.co.thepress.test-app.s3-website-ap-southeast-2.amazonaws.com"
        override_host       = "nz.co.thepress.test-app.s3-website-ap-southeast-2.amazonaws.com"
        port                = 80
    }
    backend {
        name                = "app-test-waikatotimes"
        address             = "nz.co.waikatotimes.test-app.s3-website-ap-southeast-2.amazonaws.com"
        override_host       = "nz.co.waikatotimes.test-app.s3-website-ap-southeast-2.amazonaws.com"
        port                = 80
    }
    backend {
        name                = "idp"
        override_host       = "stuff.onelogin.com"
        address             = "stuff.onelogin.com"
        ssl_sni_hostname    = "stuff.onelogin.com"
        ssl_cert_hostname   = "stuff.onelogin.com"
        use_ssl             = true
        port                = 443
    }

    domain {
        name                = "app-dev.thepost.co.nz"
    }
    domain {
        name                = "app-dev.thepress.co.nz"
    }
    domain {
        name                = "app-dev.waikatotimes.co.nz"
    }
    domain {
        name                = "app-test.thepost.co.nz"
    }
    domain {
        name                = "app-test.thepress.co.nz"
    }
    domain {
        name                = "app-test.waikatotimes.co.nz"
    }

    package {
        filename            = "../../computeEdge/mastheads-non-prod/pkg/mastheads-non-prod.tar.gz"
        source_code_hash    = data.fastly_package_hash.package.hash
    }

    resource_link {
        name                = "stuff_basic_auth"
        resource_id         = fastly_configstore.stuff_basic_auth.id
    }

    resource_link {
        name                = "domain_backend_map"
        resource_id         = fastly_configstore.domain_backend_map.id
    }
}