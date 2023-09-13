resource "google_service_usage_consumer_quota_override" "override" {
  #loop through all quota objects in the variable. They dont have a key so we create one using the join
  for_each = { for quota in var.quotas : join("_", [quota.service, quota.metric, quota.limit]) => quota }

  provider = google-beta
  project  = var.project_id

  service        = each.value.service
  metric         = urlencode("${each.value.service}/${each.value.metric}")
  limit          = urlencode(each.value.limit)
  override_value = each.value.value

  # Set force to true to make sure the reduction goes through. Default more than 10% decrease is refused
  force = true
}
