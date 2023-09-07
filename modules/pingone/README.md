<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_pingone"></a> [pingone](#requirement\_pingone) | ~> 0.18 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_pingone"></a> [pingone](#provider\_pingone) | 0.20.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [pingone_environment.demo_environment](https://registry.terraform.io/providers/pingidentity/pingone/latest/docs/resources/environment) | resource |
| [pingone_role_assignment_user.admin_sso_davninci_admin](https://registry.terraform.io/providers/pingidentity/pingone/latest/docs/resources/role_assignment_user) | resource |
| [pingone_role.davinci_admin](https://registry.terraform.io/providers/pingidentity/pingone/latest/docs/data-sources/role) | data source |
| [pingone_user.dv_admin_user](https://registry.terraform.io/providers/pingidentity/pingone/latest/docs/data-sources/user) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_demo_environment_name"></a> [demo\_environment\_name](#input\_demo\_environment\_name) | n/a | `string` | n/a | yes |
| <a name="input_license_id"></a> [license\_id](#input\_license\_id) | n/a | `string` | n/a | yes |
| <a name="input_pingone_environment_id"></a> [pingone\_environment\_id](#input\_pingone\_environment\_id) | n/a | `string` | n/a | yes |
| <a name="input_pingone_username"></a> [pingone\_username](#input\_pingone\_username) | n/a | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_demo_environment_id"></a> [demo\_environment\_id](#output\_demo\_environment\_id) | n/a |
<!-- END_TF_DOCS -->