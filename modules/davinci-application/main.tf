resource "davinci_application" "app" {
  name           = var.app_name
  environment_id = var.demo_environment_id
  oauth {
    enabled = true
    values {
      allowed_grants                = ["authorizationCode"]
      allowed_scopes                = ["openid", "profile"]
      enabled                       = true
      enforce_signed_request_openid = false
      redirect_uris                 = ["https://auth.pingone.com/0000-0000-000/rp/callback/openid_connect"]
    }
  }

  dynamic "policy" {
    for_each = var.flows
    content {
      name   = policy.value.name
      status = "enabled"
      policy_flow {
        flow_id    = policy.value.id
        version_id = -1
        weight     = 100
      }
    }
  }

  saml {
    values {
      enabled                = false
      enforce_signed_request = false
    }
  }
}

output "pinglibrary_prod_app_key" {
  value = resource.davinci_application.app.api_keys.prod
}

