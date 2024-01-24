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

  saml {
    values {
      enabled                = false
      enforce_signed_request = false
    }
  }
}

#resource "davinci_application_flow_policy" "app_policy" {
#  environment_id = var.demo_environment_id
#  application_id = resource.davinici_application.app
#
#  dynamic "policy" {
#    content {
#      name           = policy.value.name
#      status         = "enabled"
#      policy_flow {
#        flow_id    = policy.value.id
#        version_id = -1
#        weight     = 100
#      }
#    }
#  }
#}

output "pinglibrary_prod_app_key" {
  value = resource.davinci_application.app.api_keys.prod
}
