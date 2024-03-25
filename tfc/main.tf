terraform {
  required_providers {
    tfe = {
      source = "hashicorp/tfe"
    }
  }
}

provider "tfe" {
  organization = "hashi_strawb_testing"
}

resource "tfe_project" "test" {
  name = "monorepo-test"
}


# Here's a workspace for each of my workspace directories
resource "tfe_workspace" "ws" {
  count = 10

  auto_apply = true
  name       = "many-workspace-test-${format("%04d", count.index)}"

  project_id        = tfe_project.test.id
  working_directory = "individual-workspaces/ws-${format("%04d", count.index)}"

  # trigger an update if the module repo updates
  trigger_prefixes = ["/modules"]

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


# Workaround Workspace
resource "tfe_workspace" "workaround" {
  auto_apply        = true
  name              = "workaround"
  project_id        = tfe_project.test.id
  working_directory = "workaround"

  # Always trigger a run
  file_triggers_enabled = false

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
