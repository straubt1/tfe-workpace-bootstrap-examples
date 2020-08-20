# TFE_HOSTNAME
# TFE_TOKEN
provider "tfe" {}

locals {
  # This is a local variable for demo but could easily be exposed as a Terraform Variable
  all_workspaces = {
    "workspace_a_tf13" = {
      names = ["workspace_a_tf13-1", "workspace_a_tf13-2", "workspace_a_tf13-3"]
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
    },
    "workspace_b_tf13" = {
      names = ["workspace_b_tf13-1", "workspace_b_tf13-2"]
      teams_access = [
        {
          id     = var.team_dev
          access = "plan"
        }
      ]
    },
    # Uncomment to add Workspace C
    # {
    #   names = ["workspace_c_tf13-1"]
    #   teams_access = [
    #     {
    #       id     = var.team_dev
    #       access = "plan"
    #     }
    #   ]
    # }
  }
}

# For each workspace is pulled from the variable (no code change required)
module "workspaces" {
  source   = "../modules/workspaces"
  for_each = local.all_workspaces

  organization_name = var.organization_name
  names             = each.value.names
  teams_access      = each.value.teams_access
}
