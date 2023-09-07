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
| [davinci_application.app](https://registry.terraform.io/providers/pingidentity/davinci/latest/docs/resources/application) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_name"></a> [app\_name](#input\_app\_name) | n/a | `string` | n/a | yes |
| <a name="input_demo_environment_id"></a> [demo\_environment\_id](#input\_demo\_environment\_id) | n/a | `string` | n/a | yes |
| <a name="input_flows"></a> [flows](#input\_flows) | n/a | <pre>list(object({<br>    name = string<br>    id   = string<br>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_pinglibrary_prod_app_key"></a> [pinglibrary\_prod\_app\_key](#output\_pinglibrary\_prod\_app\_key) | n/a |
<!-- END_TF_DOCS -->