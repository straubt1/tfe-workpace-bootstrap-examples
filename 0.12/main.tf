# TFE_HOSTNAME
# TFE_TOKEN
provider "tfe" {}

# For each workspace, add a module call (requires a code change)
module "workspace_a" {
  source = "../modules/workspaces"

  organization_name = var.organization_name
  names             = ["workspace_a_tf12-1", "workspace_a_tf12-2", "workspace_a_tf12-3"]
  teams_access = [
    {
      id     = var.team_admin
      access = "admin"
    },
    {
      id     = var.team_dev
      access = "plan"
    }
  ]
}

module "workspace_b" {
  source = "../modules/workspaces"

  organization_name = var.organization_name
  names             = ["workspace_b_tf12-1", "workspace_b_tf12-2"]
  teams_access = [
    {
      id     = var.team_dev
      access = "plan"
    }
  ]
}

# Uncomment to add Workspace C
# module "workspace_c" {
#   source = "../modules/workspaces"

#   organization_name = var.organization_name
#   names             = ["workspace_c_tf12-1"]
#   teams_access = [
#     {
#       id     = var.team_dev
#       access = "plan"
#     }
#   ]
# }
