
data "davinci_connections" "read_all" {
  environment_id = var.demo_environment_id
}

resource "davinci_connection" "amazon_simple_email" {
  name           = "Amazon Simple Email"
  connector_id   = "amazonSimpleEmailConnector"
  environment_id = var.demo_environment_id

  depends_on = [
    data.davinci_connections.read_all
  ]
}

resource "davinci_connection" "flow" {
  name           = "Flow Connector"
  connector_id   = "flowConnector"
  environment_id = var.demo_environment_id

  depends_on = [
    data.davinci_connections.read_all
  ]
}

resource "davinci_connection" "challenge" {
  environment_id = var.demo_environment_id
  name           = "Challenge"
  connector_id   = "challengeConnector"

  depends_on = [
    data.davinci_connections.read_all
  ]
}

resource "davinci_connection" "teleport" {
  environment_id = var.demo_environment_id
  name           = "Teleport"
  connector_id   = "nodeConnector"

  depends_on = [
    data.davinci_connections.read_all
  ]
}

resource "davinci_connection" "flow_analytics" {
  environment_id = var.demo_environment_id
  name           = "Flow Analytics"
  connector_id   = "analyticsConnector"

  depends_on = [
    data.davinci_connections.read_all
  ]
}

resource "davinci_connection" "pingone_verify" {
  environment_id = var.demo_environment_id
  name           = "PingOne Verify"
  connector_id   = "pingOneVerifyConnector"
  property {
    name  = "envId"
    value = var.pingone_environment_id
  }
  property {
    name  = "clientId"
    value = var.pingone_client_id
  }
  property {
    name  = "clientSecret"
    value = var.pingone_client_secret
  }

  depends_on = [
    data.davinci_connections.read_all
  ]
}

resource "davinci_connection" "pingone_credentials" {
  environment_id = var.demo_environment_id
  name           = "PingOne Credentials"
  connector_id   = "pingOneCredentialsConnector"
  property {
    name  = "envId"
    value = var.pingone_environment_id
  }
  property {
    name  = "clientId"
    value = var.pingone_client_id
  }
  property {
    name  = "clientSecret"
    value = var.pingone_client_secret
  }

  depends_on = [
    data.davinci_connections.read_all
  ]
}

resource "davinci_connection" "pingone" {
  environment_id = var.demo_environment_id
  name           = "PingOne"
  connector_id   = "pingOneSSOConnector"
  property {
    name  = "envId"
    value = var.pingone_environment_id
  }
  property {
    name  = "clientId"
    value = var.pingone_client_id
  }
  property {
    name  = "clientSecret"
    value = var.pingone_client_secret
  }

  depends_on = [
    data.davinci_connections.read_all
  ]
}


resource "davinci_connection" "http" {
  name           = "Http"
  connector_id   = "httpConnector"
  environment_id = var.demo_environment_id

  depends_on = [
    data.davinci_connections.read_all
  ]
}

resource "davinci_connection" "annotation" {
  name           = "Annotation"
  connector_id   = "annotationConnector"
  environment_id = var.demo_environment_id

  depends_on = [
    data.davinci_connections.read_all
  ]
}

resource "davinci_connection" "functions" {
  name           = "Functions"
  connector_id   = "functionsConnector"
  environment_id = var.demo_environment_id

  depends_on = [
    data.davinci_connections.read_all
  ]
}

resource "davinci_connection" "error_message" {
  name           = "Error Message"
  connector_id   = "errorConnector"
  environment_id = var.demo_environment_id

  depends_on = [
    data.davinci_connections.read_all
  ]
}
resource "davinci_connection" "variables" {
  name           = "Variables"
  connector_id   = "variablesConnector"
  environment_id = var.demo_environment_id

  depends_on = [
    data.davinci_connections.read_all
  ]
}

output "dv_conns" {
  value = {
    names       = ["Amazon Simple Email", "Flow", "Challenge", "Teleport", "Flow Analytics", "PingOne Verify", "PingOne Credentials", "PingOne", "Http", "Annotation", "Functions", "Error Message", "Variables"]
    connections = [resource.davinci_connection.amazon_simple_email, resource.davinci_connection.flow, resource.davinci_connection.challenge, resource.davinci_connection.teleport, resource.davinci_connection.flow_analytics, resource.davinci_connection.pingone_verify, resource.davinci_connection.pingone_credentials, resource.davinci_connection.pingone, resource.davinci_connection.http, resource.davinci_connection.annotation, resource.davinci_connection.functions, resource.davinci_connection.error_message, resource.davinci_connection.variables]

  }
}
