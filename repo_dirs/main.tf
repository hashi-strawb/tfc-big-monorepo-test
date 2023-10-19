resource "local_file" "ws" {
  count = 500


  content  = <<EOF
module "pet" {
  source = "../../modules/random"
}
EOF
  filename = "../individual-workspaces/ws-${format("%04d", count.index)}/main.tf"
}
