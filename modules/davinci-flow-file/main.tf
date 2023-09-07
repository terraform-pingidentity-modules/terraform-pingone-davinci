

resource "davinci_flow" "demoflow" {
  environment_id = var.demo_environment_id
  flow_json      = file(var.flow_file)
  deploy         = true

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

output "flows" {
  value = [{
    id   = resource.davinci_flow.demoflow.id
    name = resource.davinci_flow.demoflow.name
  }]
}
