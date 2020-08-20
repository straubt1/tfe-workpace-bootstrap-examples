variable "organization_name" {
  description = "The organization name to create the workspace in."
  type        = string
}

variable "names" {
  description = "The list of workspace names to create."
  type        = list(string)
  default     = []
}

variable "teams_access" {
  description = "The list of teams and their level of access to the workspaces."
  type = list(object({
    id     = string
    access = string
  }))
}
