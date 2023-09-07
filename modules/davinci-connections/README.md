<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_davinci"></a> [davinci](#requirement\_davinci) | ~> 0.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_davinci"></a> [davinci](#provider\_davinci) | 0.1.12 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [davinci_connection.amazon_simple_email](https://registry.terraform.io/providers/pingidentity/davinci/latest/docs/resources/connection) | resource |
| [davinci_connection.challenge](https://registry.terraform.io/providers/pingidentity/davinci/latest/docs/resources/connection) | resource |
| [davinci_connection.flow](https://registry.terraform.io/providers/pingidentity/davinci/latest/docs/resources/connection) | resource |
| [davinci_connection.flow_conductor](https://registry.terraform.io/providers/pingidentity/davinci/latest/docs/resources/connection) | resource |
| [davinci_connection.pingone_credentials](https://registry.terraform.io/providers/pingidentity/davinci/latest/docs/resources/connection) | resource |
| [davinci_connection.pingone_verify](https://registry.terraform.io/providers/pingidentity/davinci/latest/docs/resources/connection) | resource |
| [davinci_connection.teleport](https://registry.terraform.io/providers/pingidentity/davinci/latest/docs/resources/connection) | resource |
| [davinci_connections.read_all](https://registry.terraform.io/providers/pingidentity/davinci/latest/docs/data-sources/connections) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_demo_environment_id"></a> [demo\_environment\_id](#input\_demo\_environment\_id) | n/a | `string` | n/a | yes |
| <a name="input_pingone_client_id"></a> [pingone\_client\_id](#input\_pingone\_client\_id) | n/a | `string` | n/a | yes |
| <a name="input_pingone_client_secret"></a> [pingone\_client\_secret](#input\_pingone\_client\_secret) | n/a | `string` | n/a | yes |
| <a name="input_pingone_environment_id"></a> [pingone\_environment\_id](#input\_pingone\_environment\_id) | n/a | `string` | n/a | yes |
| <a name="input_pingone_region"></a> [pingone\_region](#input\_pingone\_region) | n/a | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_dv_conns"></a> [dv\_conns](#output\_dv\_conns) | n/a |
<!-- END_TF_DOCS -->