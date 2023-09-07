resource "pingone_environment" "demo_environment" {
  name        = var.demo_environment_name
  description = "Demo environment for Ping Library Solutions"
  type        = "SANDBOX"
  license_id  = var.license_id


  default_population {
    name        = "Demo Population"
    description = "Demo population for users"
  }

  service {
    type = "SSO"
  }

  service {
    type = "MFA"
  }

  service {
    type = "DaVinci"
    bookmark {
      name = "Ping Library Flow Runner"
      url  = "https://dev.pinglibrary.com/flow-runner"
    }
  }
}

// DaVinci Admin - Used for console access
data "pingone_role" "davinci_admin" {
  name = "DaVinci Admin"
}

// Get the ID of the DV admin user
data "pingone_user" "dv_admin_user" {
  environment_id = var.pingone_environment_id
  username       = var.pingone_username
}

data "pingone_user" "user_terrysigle" {
  environment_id = var.pingone_environment_id
  username       = "terrysigle@pingidentity.com"
}

// Assign the "Identity Data Admin" role to the DV admin user
resource "pingone_role_assignment_user" "admin_sso_davninci_admin" {
  environment_id       = var.pingone_environment_id
  user_id              = data.pingone_user.dv_admin_user.id
  role_id              = data.pingone_role.davinci_admin.id
  scope_environment_id = pingone_environment.demo_environment.id
}

output "demo_environment_id" {
  value = resource.pingone_environment.demo_environment.id
  depends_on = [
    resource.pingone_role_assignment_user.admin_sso_davninci_admin
  ]
}

