locals {
  # Combine every combination of Workspace and Teams to load a local variable we can iterate over
  # tfe_team_access = [
  #   for pair in setproduct(var.names, var.teams_access) : {
  #     # key is a unique value for each combo of workspace name, team, and access (used in for_each below)
  #     key = format("%s_%s_%s", pair[0], pair[1].id, pair[1].access)

  #     workspace_id = pair[0] #tfe_workspace.ws[pair[0]].id
  #     team_id      = pair[1].id
  #     team_access  = pair[1].access
  #   }
  # ]

  tfe_team_access = {
    for ta in var.teams_access : format("%s_%s", ta.id, ta.access) => ta
  }
}
output "test" {
  value = local.tfe_team_access
}

resource "tfe_workspace" "ws" {
  organization = var.organization_name
  name         = var.workspace_name
}

resource "tfe_team_access" "access" {
  for_each = {
    for ta in var.teams_access : format("%s_%s", ta.id, ta.access) => ta
  }

  workspace_id = tfe_workspace.ws.id
  # workspace_id = "ws-9RSciPniZXdLBWZd" # tfe_workspace.ws.id
  team_id = each.value.id
  access  = each.value.access
}
