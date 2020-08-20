# tfe-workpace-bootstrap-examples

Examples on how to manage TFE Workspaces with the TFE Terraform Provider.

There are two examples leveraging Terraform 0.12 and Terraform 0.13 syntax.

Both examples aim to create the following:

- Workspaces for "A" (three in total postfixed with 1-3)
  - Each workspace for "A" has team assignments for "admin" and "plan"
- Workspaces for "B" (two in total postfixed with 1-2)
  - Each workspace for "B" has a team assignment for "plan"


## ./bootstrap [Optional]

Creates a new TFE Organization and two TFE Teams that can be used to create a repeatable test of these examples.

## ./0.12

Each module call is a separate "module" block.
To add workspaces, Terraform must be created (not ideal).

```sh
$ terraform state list
module.workspace_a.tfe_team_access.access["workspace_a_tf12-1_team-awQAzgvCeDJ43TLb_plan"]
module.workspace_a.tfe_team_access.access["workspace_a_tf12-1_team-ghXhy7R8AnN18Aki_admin"]
module.workspace_a.tfe_team_access.access["workspace_a_tf12-2_team-awQAzgvCeDJ43TLb_plan"]
module.workspace_a.tfe_team_access.access["workspace_a_tf12-2_team-ghXhy7R8AnN18Aki_admin"]
module.workspace_a.tfe_team_access.access["workspace_a_tf12-3_team-awQAzgvCeDJ43TLb_plan"]
module.workspace_a.tfe_team_access.access["workspace_a_tf12-3_team-ghXhy7R8AnN18Aki_admin"]
module.workspace_a.tfe_workspace.ws["workspace_a_tf12-1"]
module.workspace_a.tfe_workspace.ws["workspace_a_tf12-2"]
module.workspace_a.tfe_workspace.ws["workspace_a_tf12-3"]
module.workspace_b.tfe_team_access.access["workspace_b_tf12-1_team-awQAzgvCeDJ43TLb_plan"]
module.workspace_b.tfe_team_access.access["workspace_b_tf12-2_team-awQAzgvCeDJ43TLb_plan"]
module.workspace_b.tfe_workspace.ws["workspace_b_tf12-1"]
module.workspace_b.tfe_workspace.ws["workspace_b_tf12-2"]
```

## ./0.13

Leveraging `for_each` on modules (new to Terraform 0.13), there is only a single "module" block.
To add workspaces, the variable could be updated.

```sh
$ terraform state list
module.workspaces["workspace_a_tf13"].tfe_team_access.access["workspace_a_tf13-1_team-awQAzgvCeDJ43TLb_plan"]
module.workspaces["workspace_a_tf13"].tfe_team_access.access["workspace_a_tf13-1_team-ghXhy7R8AnN18Aki_admin"]
module.workspaces["workspace_a_tf13"].tfe_team_access.access["workspace_a_tf13-2_team-awQAzgvCeDJ43TLb_plan"]
module.workspaces["workspace_a_tf13"].tfe_team_access.access["workspace_a_tf13-2_team-ghXhy7R8AnN18Aki_admin"]
module.workspaces["workspace_a_tf13"].tfe_team_access.access["workspace_a_tf13-3_team-awQAzgvCeDJ43TLb_plan"]
module.workspaces["workspace_a_tf13"].tfe_team_access.access["workspace_a_tf13-3_team-ghXhy7R8AnN18Aki_admin"]
module.workspaces["workspace_a_tf13"].tfe_workspace.ws["workspace_a_tf13-1"]
module.workspaces["workspace_a_tf13"].tfe_workspace.ws["workspace_a_tf13-2"]
module.workspaces["workspace_a_tf13"].tfe_workspace.ws["workspace_a_tf13-3"]
module.workspaces["workspace_b_tf13"].tfe_team_access.access["workspace_b_tf13-1_team-awQAzgvCeDJ43TLb_plan"]
module.workspaces["workspace_b_tf13"].tfe_team_access.access["workspace_b_tf13-2_team-awQAzgvCeDJ43TLb_plan"]
module.workspaces["workspace_b_tf13"].tfe_workspace.ws["workspace_b_tf13-1"]
module.workspaces["workspace_b_tf13"].tfe_workspace.ws["workspace_b_tf13-2"]
```
