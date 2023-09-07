
data "http" "demoflow" {
  count = var.flow_url != null ? 1 : 0
  url   = var.flow_url
}

locals {
  flow_json = var.flow_file != null ? file(var.flow_file) : data.http.demoflow[0].response_body
}

resource "davinci_flow" "demoflow" {
  environment_id = var.demo_environment_id
  flow_json      = local.flow_json
  deploy         = true

  dynamic "connection_link" {
    for_each = var.connections
    content {
      name = var.all_conns.connections[index(var.all_conns.names, connection_link.value)].name
      id   = var.all_conns.connections[index(var.all_conns.names, connection_link.value)].id
    }
  }

  dynamic "subflow_link" {
    for_each = var.subflows
    content {
      name = subflow_link.value.name
      id   = subflow_link.value.id
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}

output "flow" {
  value = {
    id   = resource.davinci_flow.demoflow.id
    name = resource.davinci_flow.demoflow.name
  }
}
