resource "google_billing_budget" "budget-alert" {
  billing_account = var.billing_account
  display_name    = "hackathon-${var.team_name}-budget-alert"

  budget_filter {
    projects = ["projects/${var.project_id}"]
  }

  amount {
    specified_amount {
      currency_code = "EUR"
      units         = var.project_budget
    }
  }

  threshold_rules {
    threshold_percent = 0.25
  }
  threshold_rules {
    threshold_percent = 0.5
  }
  threshold_rules {
    threshold_percent = 0.75
  }
  threshold_rules {
    threshold_percent = 1
  }
  threshold_rules {
    threshold_percent = 1.1
  }
  threshold_rules {
    threshold_percent = 1.25
  }
  all_updates_rule {
    disable_default_iam_recipients = true

    monitoring_notification_channels = local.notification_channel_ids
  }
}

locals {
  # Collect all channel id's into a list usable by the "google_billing_budget"
  notification_channel_ids = [for channel in google_monitoring_notification_channel.notification_channel : channel.id]
}

# If using group email, configure group to accept mail form "alerting-noreply@google.com"
resource "google_monitoring_notification_channel" "notification_channel" {
  project = var.project_id

  for_each = { for member in var.team_members : member.email => member }

  display_name = "Budget Notification Channel ${var.team_name} - ${each.value.email}"
  type         = "email"

  labels = {
    email_address = each.value.email
  }
}