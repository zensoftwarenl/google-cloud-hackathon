# quotas

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google-beta"></a> [google-beta](#provider\_google-beta) | 4.81.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google-beta_google_service_usage_consumer_quota_override.override](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_service_usage_consumer_quota_override) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The project id the quotas should be applied on | `any` | n/a | yes |
| <a name="input_quotas"></a> [quotas](#input\_quotas) | The list of quotas that will be applied to the project. | <pre>list(object({<br>    service = string<br>    metric  = string<br>    limit   = string<br>    value   = string<br>  }))</pre> | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
