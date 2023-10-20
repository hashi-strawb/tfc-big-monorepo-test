# Testing many TFC Workspaces linked to one repo

There's a few directories here:

* workspaces - contains the config used by a TFC workspace. It does nothing except source a module...

* modules/random - a very simple terraform module. uses the random provider, so has no requirements for any credentials or external dependencies

* tfc - configures Terraform Cloud to create a lot of workspaces. this is specific to my TFC org, so you will likely need to change a few values




There are a few other directories which I've not used yet, to test variants of the issue

* repo_dirs - creates a lot of directories, to allow me to test the case where each of the 500 or so workspaces is linked to a different directory

* individual-workspaces - these are the directories created by repo_dirs
