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
  count = 10

  auto_apply        = true
  name              = "many-workspace-test-${format("%04d", count.index)}"
  organization      = "hashi_strawb_testing"
  project_id        = "prj-8rNEinGacXMAwCr4"
  trigger_prefixes  = ["/modules"]
  working_directory = "workspaces/"
  vcs_repo {
    github_app_installation_id = "ghain-3JcBMQW48TPfPn4f"
    identifier                 = "hashi-strawb/tfc-big-monorepo-test"
  }
}
