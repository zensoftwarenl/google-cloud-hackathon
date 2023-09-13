terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.80.0"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "4.80.0"
    }
  }
}

provider "google" {}

terraform {
  backend "remote" {}
}

resource "google_folder" "hackathon_folder" {
  display_name = var.folder_name
  parent       = var.folder_parent
}

module "project-factory" {
  #checkov:skip=CKV_TF_1:Reducing line count not needed, most lines are apis that are getting enabled

  source  = "terraform-google-modules/project-factory/google"
  version = "~> 14.3"

  for_each = { for team in var.team_list : team.name => team }

  name              = each.value.name
  random_project_id = true
  org_id            = var.organization_id
  billing_account   = var.billing_account
  folder_id         = google_folder.hackathon_folder.name

  default_service_account = "keep"
  auto_create_network     = false

  activate_apis = [
    "billingbudgets.googleapis.com",
    "logging.googleapis.com",
    "iam.googleapis.com",
    "container.googleapis.com",
    "sqladmin.googleapis.com",
    "run.googleapis.com",
    "monitoring.googleapis.com",
    "cloudbilling.googleapis.com",
    "servicenetworking.googleapis.com",
    "secretmanager.googleapis.com",
    "cloudbuild.googleapis.com",
    "servicecontrol.googleapis.com",
    "apikeys.googleapis.com",
    "compute.googleapis.com",
    "artifactregistry.googleapis.com",
    "sourcerepo.googleapis.com",
    "appengine.googleapis.com",
    "cloudscheduler.googleapis.com",
    "pubsub.googleapis.com",
    "bigquery.googleapis.com",
    "dataflow.googleapis.com",
    "cloudfunctions.googleapis.com",
    "dns.googleapis.com",
    "storage-api.googleapis.com",
    "storage-component.googleapis.com",
    "datastore.googleapis.com",
    "translate.googleapis.com",
    "vision.googleapis.com",
    "cloudprofiler.googleapis.com",
    "sheets.googleapis.com",
    "texttospeech.googleapis.com",
    "speech.googleapis.com",
    "servicemanagement.googleapis.com",
    "roads.googleapis.com",
    "iap.googleapis.com",
    "firebasestorage.googleapis.com",
    "file.googleapis.com",
    "fcm.googleapis.com",
    "containerregistry.googleapis.com",
    "aiplatform.googleapis.com",
    "customsearch.googleapis.com",
    "recommendationengine.googleapis.com",
    "retail.googleapis.com",
  ]
}

locals {
  project_factory_keys = keys(module.project-factory)
}

locals {
  project_ids = {
    team1 = {
      team_name    = var.team_list[0].name
      team_members = var.team_list[0].members
      project_id   = module.project-factory[local.project_factory_keys[0]].project_id
    }
    team2 = {
      team_name    = var.team_list[1].name
      team_members = var.team_list[1].members
      project_id   = module.project-factory[local.project_factory_keys[1]].project_id
    }
  }
}

module "budget-alert" {
  source = "./modules/budget_alert"

  for_each     = local.project_ids
  project_id   = each.value.project_id
  team_name    = each.value.team_name
  team_members = each.value.team_members

  billing_account = var.billing_account
}

module "quotas" {
  source = "./modules/quotas"

  for_each   = local.project_ids
  project_id = each.value.project_id

  quotas = var.quota_list
}

module "iam" {
  source = "./modules/iam"

  for_each = local.project_ids

  team_members = each.value.team_members
  project_id   = each.value.project_id
}


