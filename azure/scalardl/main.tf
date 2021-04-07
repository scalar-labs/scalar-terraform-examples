module "scalardl" {
  source = "git::https://github.com/scalar-labs/scalar-terraform.git//modules/azure/scalardl?ref=master"

  # Required Variables (Use remote state)
  network = local.network

  # Optional Variables
  base     = var.base
  envoy    = var.envoy
  scalardl = local.scalardl
}
