locals {
  # Combine every combination of Workspace and Teams to load a local variable we can iterate over
  tfe_team_access = [
    for pair in setproduct(var.names, var.teams_access) : {
      # key is a unique value for each combo of workspace name, team, and access (used in for_each below)
      key = format("%s_%s_%s", pair[0], pair[1].id, pair[1].access)

      workspace_id = tfe_workspace.ws[pair[0]].id
      team_id      = pair[1].id
      team_access  = pair[1].access
    }
  ]
}

resource "tfe_workspace" "ws" {
  for_each = toset(var.names)

  organization = var.organization_name
  name         = each.key
}

resource "tfe_team_access" "access" {
  for_each = {
    for tta in local.tfe_team_access : tta.key => tta
  }

  workspace_id = each.value.workspace_id
  team_id      = each.value.team_id
  access       = each.value.team_access
}
