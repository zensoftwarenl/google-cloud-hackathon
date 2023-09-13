variable "project_id" {
  description = "The project the given team members should be given a role in"
}
variable "team_members" {
  description = "The list of team members and their respective role that will be assigned"
  type = list(object({
    email = string
    role  = string
  }))
}