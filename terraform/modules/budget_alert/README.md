# budget_alert

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 4.81.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_billing_budget.budget-alert](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/billing_budget) | resource |
| [google_monitoring_notification_channel.notification_channel](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/monitoring_notification_channel) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_billing_account"></a> [billing\_account](#input\_billing\_account) | The billing account the budget alert will be added under | `any` | n/a | yes |
| <a name="input_project_budget"></a> [project\_budget](#input\_project\_budget) | The budget of the project in EUR | `string` | `"300"` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The project id the budget alerts should be added for | `any` | n/a | yes |
| <a name="input_team_members"></a> [team\_members](#input\_team\_members) | The email list that should be added to the communication channel for the budget alert | <pre>list(object({<br>    email = string<br>    role  = string<br>  }))</pre> | n/a | yes |
| <a name="input_team_name"></a> [team\_name](#input\_team\_name) | The team name that is used for the budget alert name | `any` | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
