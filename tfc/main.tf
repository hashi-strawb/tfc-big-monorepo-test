terraform {
  required_providers {
    tfe = {
      source = "hashicorp/tfe"
    }
  }
}

provider "tfe" {
  # Configuration options
}



resource "tfe_workspace" "ws" {
  count = 500

  auto_apply        = true
  name              = "many-workspace-test-${format("%04d", count.index)}"
  organization      = "hashi_strawb_testing"
  project_id        = "prj-8rNEinGacXMAwCr4"
  trigger_prefixes  = ["/modules"]
  working_directory = "workspaces/"
  vcs_repo {
    # built-in github app (no custom webhooks)
    github_app_installation_id = "ghain-3JcBMQW48TPfPn4f"

    # custom github provider
    # oauth_token_id             = "ot-TZxcR8MRaTRvteFL"

    identifier = "hashi-strawb/tfc-big-monorepo-test"
  }

  # allow me to delete a workspace without destroying its resource
  # which is safe in this case, as they're all random pets
  force_delete = true
}
