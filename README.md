# google-cloud-hackathon

Setup one or more google projects with the correct restrictions and quotas for the ZENsoftware hackathon.

For the opensource version we replaced the Email addresses with placeholders. 

## Terraform 
Project is mainly terraform and the state file is managed by [terraform cloud](https://app.terraform.io/app/zen-software/workspaces).

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_google"></a> [google](#requirement\_google) | 4.80.0 |
| <a name="requirement_google-beta"></a> [google-beta](#requirement\_google-beta) | 4.80.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 4.80.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_budget-alert"></a> [budget-alert](#module\_budget-alert) | ./modules/budget_alert | n/a |
| <a name="module_iam"></a> [iam](#module\_iam) | ./modules/iam | n/a |
| <a name="module_project-factory"></a> [project-factory](#module\_project-factory) | terraform-google-modules/project-factory/google | ~> 14.3 |
| <a name="module_quotas"></a> [quotas](#module\_quotas) | ./modules/quotas | n/a |

## Resources

| Name | Type |
|------|------|
| [google_folder.hackathon_folder](https://registry.terraform.io/providers/hashicorp/google/4.80.0/docs/resources/folder) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_billing_account"></a> [billing\_account](#input\_billing\_account) | The billing account that should be used for all hackathon projects. (Will also get all billing alerts generated) | `string` | n/a | yes |
| <a name="input_folder_name"></a> [folder\_name](#input\_folder\_name) | The folder name for the newly generated folder for all the hackathon projects | `string` | `"hackathon"` | no |
| <a name="input_folder_parent"></a> [folder\_parent](#input\_folder\_parent) | The parent folder that will contain the new folder for the hackathon projects.<br> Use 'folder/{folder\_id}' if you want to use a folder as parent. <br> Use 'organizations/{org\_id} if you want to create the new folder directly under the organisation. | `string` | `"organizations/000000000000"` | no |
| <a name="input_organization_id"></a> [organization\_id](#input\_organization\_id) | The organisation id the folder should be created under | `number` | n/a | yes |
| <a name="input_quota_list"></a> [quota\_list](#input\_quota\_list) | The list of quotas that will be enabled for each hackathon team / project | <pre>list(object({<br>    service = string<br>    metric  = string<br>    limit   = string<br>    value   = any<br>  }))</pre> | <pre>[<br>  {<br>    "limit": "/project/region",<br>    "metric": "instances",<br>    "service": "compute.googleapis.com",<br>    "value": "5"<br>  },<br>  {<br>    "limit": "/project/region",<br>    "metric": "disks_total_storage",<br>    "service": "compute.googleapis.com",<br>    "value": "500"<br>  },<br>  {<br>    "limit": "/project",<br>    "metric": "cpus_all_regions",<br>    "service": "compute.googleapis.com",<br>    "value": "50"<br>  },<br>  {<br>    "limit": "/project/region",<br>    "metric": "ssd_total_storage",<br>    "service": "compute.googleapis.com",<br>    "value": "500"<br>  },<br>  {<br>    "limit": "/min/project/user",<br>    "metric": "requests",<br>    "service": "customsearch.googleapis.com",<br>    "value": "10"<br>  },<br>  {<br>    "limit": "/min/project",<br>    "metric": "requests",<br>    "service": "customsearch.googleapis.com",<br>    "value": "10"<br>  },<br>  {<br>    "limit": "/d/project",<br>    "metric": "requests",<br>    "service": "customsearch.googleapis.com",<br>    "value": "1000"<br>  },<br>  {<br>    "limit": "/min/project/user",<br>    "metric": "unlimitedbucket",<br>    "service": "customsearch.googleapis.com",<br>    "value": "10"<br>  },<br>  {<br>    "limit": "/min/project",<br>    "metric": "unlimitedbucket",<br>    "service": "customsearch.googleapis.com",<br>    "value": "10"<br>  },<br>  {<br>    "limit": "/d/project",<br>    "metric": "unlimitedbucket",<br>    "service": "customsearch.googleapis.com",<br>    "value": "1000"<br>  }<br>]</pre> | no |
| <a name="input_team_list"></a> [team\_list](#input\_team\_list) | The list of teams containing a team name and a list of members for each team. The team name will be used in the (display) name of the project. | <pre>list(object({<br>    name = string<br>    members = list(object({<br>      email = string<br>      role  = string<br>    }))<br>  }))</pre> | <pre>[<br>  {<br>    "members": [<br>      {<br>        "email": "richard_handrix@piedpiper.com",<br>        "role": "roles/owner"<br>      },<br>      {<br>        "email": "bertram_gilfoye@piedpiper.com",<br>        "role": "roles/owner"<br>      },<br>      {<br>        "email": "dinesh_chugtai@piedpiper.com",<br>        "role": "roles/owner"<br>      },<br>      {<br>        "email": "erlich_bachman@piedpiper.com",<br>        "role": "roles/owner"<br>      }<br>    ],<br>    "name": "hackathon-team-bertram"<br>  },<br>  {<br>    "members": [<br>      {<br>        "email": "richard_handrix@piedpiper.com",<br>        "role": "roles/owner"<br>      },<br>      {<br>        "email": "jared_dunn@piedpiper.com",<br>        "role": "roles/editor"<br>      },<br>      {<br>        "email": "jian_yang@piedpiper.com",<br>        "role": "roles/editor"<br>      },<br>      {<br>        "email": "Chuy_Ramirez@piedpiper.com",<br>        "role": "roles/editor"<br>      }<br>    ],<br>    "name": "hackathon-team-jared"<br>  }<br>]</pre> | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
