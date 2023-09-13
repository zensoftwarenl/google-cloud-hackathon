variable "organization_id" {
  description = "The organisation id the folder should be created under"
  type        = number
}

variable "billing_account" {
  description = "The billing account that should be used for all hackathon projects. (Will also get all billing alerts generated)"
  type        = string
}

variable "folder_parent" {
  description = "The parent folder that will contain the new folder for the hackathon projects.\n Use 'folder/{folder_id}' if you want to use a folder as parent. \n Use 'organizations/{org_id} if you want to create the new folder directly under the organisation."
  type        = string
  default     = "organizations/000000000000"
}

variable "folder_name" {
  description = "The folder name for the newly generated folder for all the hackathon projects"
  type        = string
  default     = "hackathon"
}

variable "team_list" {
  description = "The list of teams containing a team name and a list of members for each team. The team name will be used in the (display) name of the project.  "

  type = list(object({
    name = string
    members = list(object({
      email = string
      role  = string
    }))
  }))
  default = [
    {
      name = "hackathon-team-bertram",
      members = [
        {
          "email" = "richard_handrix@piedpiper.com",
          "role"  = "roles/owner"
        },
        {
          "email" = "bertram_gilfoye@piedpiper.com",
          "role"  = "roles/owner"
        },
        {
          "email" = "dinesh_chugtai@piedpiper.com",
          "role"  = "roles/owner"
        },
        {
          "email" = "erlich_bachman@piedpiper.com",
          "role"  = "roles/owner"
        }
      ],
    },
    {
      name = "hackathon-team-jared",
      members = [
        {
          "email" = "richard_handrix@piedpiper.com",
          "role"  = "roles/owner"
        },
        {
          "email" = "jared_dunn@piedpiper.com",
          "role"  = "roles/editor"
        },
        {
          "email" = "jian_yang@piedpiper.com",
          "role"  = "roles/editor"
        },
        {
          "email" = "Chuy_Ramirez@piedpiper.com",
          "role"  = "roles/editor"
        }
      ],
    }
  ]
}

variable "quota_list" {
  description = "The list of quotas that will be enabled for each hackathon team / project"

  type = list(object({
    service = string
    metric  = string
    limit   = string
    value   = any
  }))

  default = [
    {
      "service" : "compute.googleapis.com",
      "metric" : "instances",
      "limit" : "/project/region",
      "value" : "5"
    },
    {
      "service" : "compute.googleapis.com",
      "metric" : "disks_total_storage",
      "limit" : "/project/region",
      "value" : "500"
    },
    {
      "service" : "compute.googleapis.com",
      "metric" : "cpus_all_regions",
      "limit" : "/project",
      "value" : "50"
    },
    {
      "service" : "compute.googleapis.com",
      "metric" : "ssd_total_storage",
      "limit" : "/project/region",
      "value" : "500"
    },
    {
      "service" : "customsearch.googleapis.com",
      "metric" : "requests",
      "limit" : "/min/project/user"
      "value" : "10"
    },
    {
      "service" : "customsearch.googleapis.com",
      "metric" : "requests",
      "limit" : "/min/project"
      "value" : "10"
    },
    {
      "service" : "customsearch.googleapis.com",
      "metric" : "requests",
      "limit" : "/d/project"
      "value" : "1000"
    },
    {
      "service" : "customsearch.googleapis.com",
      "metric" : "unlimitedbucket",
      "limit" : "/min/project/user"
      "value" : "10"
    },
    {
      "service" : "customsearch.googleapis.com",
      "metric" : "unlimitedbucket",
      "limit" : "/min/project"
      "value" : "10"
    },
    {
      "service" : "customsearch.googleapis.com",
      "metric" : "unlimitedbucket",
      "limit" : "/d/project"
      "value" : "1000"
    }
  ]
}