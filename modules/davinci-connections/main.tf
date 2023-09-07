
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
  name           = "Flow"
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

resource "davinci_connection" "flow_conductor" {
  environment_id = var.demo_environment_id
  name           = "Flow Conductor"
  connector_id   = "flowConnector"

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

output "dv_conns" {
  value = {
    names = concat(data.davinci_connections.read_all.connections.*.name,
      [
        resource.davinci_connection.amazon_simple_email.name,
        resource.davinci_connection.flow.name,
        resource.davinci_connection.challenge.name,
        resource.davinci_connection.flow_conductor.name,
        resource.davinci_connection.teleport.name,
        resource.davinci_connection.pingone_verify.name,
        resource.davinci_connection.pingone_credentials.name
    ])
    connections = concat(tolist(data.davinci_connections.read_all.connections),
      [
        resource.davinci_connection.amazon_simple_email,
        resource.davinci_connection.flow,
        resource.davinci_connection.challenge,
        resource.davinci_connection.flow_conductor,
        resource.davinci_connection.teleport,
        resource.davinci_connection.pingone_verify,
        resource.davinci_connection.pingone_credentials
    ])
  }
}
