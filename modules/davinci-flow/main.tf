
data "http" "demoflow" {
  count = var.flow_url != null ? 1 : 0
  url   = var.flow_url
}

locals {
  flow_json = var.flow_file != null ? file(var.flow_file) : data.http.demoflow.response_body
}

resource "davinci_flow" "demoflow" {
  environment_id = var.demo_environment_id

  flow_json = local.flow_json
  # dynamic "flow_url" {
  #   for_each = [var.flow_url]
  #   content {
  #     flow_json = data.http.demoflow.response_body
  #   }
  # }

  # dynamic "flow_str" {
  #   for_each = [var.flow_file]
  #   content {
  #     flow_json = file(flow_str.value)
  #   }
  # }
  # # flow_json      = file("flows/demo-flow.json")
  # flow_json = data.http.demoflow.response_body
  deploy = true

  # Look into parsing flow, looking for connectors, constructs, subflows

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
