variable "organization_name" {
  description = "The organization name to create the workspace in."
  type        = string
}

variable "workspace_name" {
  description = "The workspace name to create."
  type        = string
}

variable "teams_access" {
  description = "The list of teams and their level of access to the workspace."
  type = list(object({
    id     = string
    access = string
  }))
}
