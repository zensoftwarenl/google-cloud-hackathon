variable "project_id" {
  description = "The project id the quotas should be applied on"
}
variable "quotas" {
  description = "The list of quotas that will be applied to the project. "
  type = list(object({
    service = string
    metric  = string
    limit   = string
    value   = string
  }))
}