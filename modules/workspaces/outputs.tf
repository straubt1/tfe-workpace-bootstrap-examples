output "workspaces" {
  description = ""
  value       = [for ws in tfe_workspace.ws : ws.id]
}

output "teams" {
  description = "Workspace and Teams"
  value = [for ta in tfe_team_access.access : {
    workspace_id = ta.workspace_id
    team_id      = ta.team_id
    access       = ta.access
  }]
}
