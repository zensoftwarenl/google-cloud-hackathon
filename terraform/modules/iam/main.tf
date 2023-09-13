resource "google_project_iam_member" "project_rights" {
  project = var.project_id

  for_each = { for member in var.team_members : member.email => member }

  member = "user:${each.value.email}"
  #tfsec:ignore:google-iam-no-user-granted-permissions # Here we want to assign a basic role to the users. The hackathon requires the user to have basic roles. 
  role = each.value.role
}