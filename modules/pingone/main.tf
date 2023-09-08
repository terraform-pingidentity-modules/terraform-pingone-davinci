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

resource "pingone_application" "demo_worker_app" {
  environment_id = resource.pingone_environment.demo_environment.id
  name           = "${var.demo_environment_name} Worker App"
  enabled        = true

  oidc_options {
    type                        = "WORKER"
    grant_types                 = ["CLIENT_CREDENTIALS"]
    token_endpoint_authn_method = "CLIENT_SECRET_BASIC"
  }
}

// DaVinci Admin - Used for console access
data "pingone_role" "davinci_admin" {
  name = "DaVinci Admin"
}

// Environment Admin - Used for console access
data "pingone_role" "environment_admin" {
  name = "Environment Admin"
}

# // Identity Data Admin - Used for console access
data "pingone_role" "identity_data_admin" {
  name = "Identity Data Admin"
}

// Get the ID of the DV admin user
data "pingone_user" "dv_admin_user" {
  environment_id = var.pingone_environment_id
  username       = var.pingone_username
}

// Assign the "Davinci Admin" role to the DV admin user
resource "pingone_role_assignment_user" "admin_sso_davinci_admin" {
  environment_id       = var.pingone_environment_id
  user_id              = data.pingone_user.dv_admin_user.id
  role_id              = data.pingone_role.davinci_admin.id
  scope_environment_id = pingone_environment.demo_environment.id
}

// Assign the "Identity Data Admin" role to the DV admin user
resource "pingone_role_assignment_user" "admin_sso_identity_data_admin" {
  environment_id       = var.pingone_environment_id
  user_id              = data.pingone_user.dv_admin_user.id
  role_id              = data.pingone_role.identity_data_admin.id
  scope_environment_id = pingone_environment.demo_environment.id
}

# // Assign the "Environment Admin" role to the DV admin user
resource "pingone_role_assignment_user" "admin_sso_environment_admin" {
  environment_id       = var.pingone_environment_id
  user_id              = data.pingone_user.dv_admin_user.id
  role_id              = data.pingone_role.environment_admin.id
  scope_environment_id = pingone_environment.demo_environment.id
}

# Assign the "Environment Admin" role to the worker app
resource "pingone_application_role_assignment" "population_identity_data_admin_to_application" {
  environment_id       = resource.pingone_environment.demo_environment.id
  application_id       = resource.pingone_application.demo_worker_app.id
  role_id              = data.pingone_role.identity_data_admin.id
  scope_environment_id = resource.pingone_environment.demo_environment.id
}

# Assign the "Environment Admin" role to the worker app
resource "pingone_application_role_assignment" "population_environment_admin_to_application" {
  environment_id       = resource.pingone_environment.demo_environment.id
  application_id       = resource.pingone_application.demo_worker_app.id
  role_id              = data.pingone_role.environment_admin.id
  scope_environment_id = resource.pingone_environment.demo_environment.id
}

output "demo_environment_id" {
  value = resource.pingone_environment.demo_environment.id
  depends_on = [
    resource.pingone_role_assignment_user.admin_sso_davinci_admin
  ]
}

output "demo_worker_app_client_id" {
  value = resource.pingone_application.demo_worker_app.oidc_options[0].client_id
}

output "demo_worker_app_client_secret" {
  value = resource.pingone_application.demo_worker_app.oidc_options[0].client_secret
}
