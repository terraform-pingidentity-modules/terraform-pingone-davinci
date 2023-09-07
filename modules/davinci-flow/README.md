<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_davinci"></a> [davinci](#requirement\_davinci) | ~> 0.1 |
| <a name="requirement_http"></a> [http](#requirement\_http) | 3.4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_davinci"></a> [davinci](#provider\_davinci) | 0.1.12 |
| <a name="provider_http"></a> [http](#provider\_http) | 3.4.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [davinci_flow.demoflow](https://registry.terraform.io/providers/pingidentity/davinci/latest/docs/resources/flow) | resource |
| [http_http.demoflow](https://registry.terraform.io/providers/hashicorp/http/3.4.0/docs/data-sources/http) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_all_conns"></a> [all\_conns](#input\_all\_conns) | Array of all connection names and resources from the davinci-connections module output | `any` | n/a | yes |
| <a name="input_connections"></a> [connections](#input\_connections) | String array list of all connections linked to the flow | `list(string)` | n/a | yes |
| <a name="input_demo_environment_id"></a> [demo\_environment\_id](#input\_demo\_environment\_id) | PingOne environemnt of the demo environment with DaVinci instance | `string` | n/a | yes |
| <a name="input_flow_file"></a> [flow\_file](#input\_flow\_file) | Local file where the flow json can be retrieved | `string` | `null` | no |
| <a name="input_flow_url"></a> [flow\_url](#input\_flow\_url) | URL where the flow json can be retrieved | `string` | `null` | no |
| <a name="input_subflows"></a> [subflows](#input\_subflows) | Resource array of all subflows linked to the flow | `list(any)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_flow"></a> [flow](#output\_flow) | n/a |
<!-- END_TF_DOCS -->