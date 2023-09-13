variable "project_budget" {
  description = "The budget of the project in EUR"
  default     = "300"
}
variable "project_id" {
  description = "The project id the budget alerts should be added for"
}
variable "team_name" {
  description = "The team name that is used for the budget alert name"
}
variable "billing_account" {
  description = "The billing account the budget alert will be added under"
}
variable "team_members" {
  description = "The email list that should be added to the communication channel for the budget alert"
  type = list(object({
    email = string
    role  = string
  }))
}