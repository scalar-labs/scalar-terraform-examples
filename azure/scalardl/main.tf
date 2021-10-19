module "scalardl" {
  source = "git::https://github.com/scalar-labs/scalar-terraform.git//modules/azure/scalardl?ref=fix/python_version"

  # Required Variables (Use remote state)
  network = local.network

  # Optional Variables
  base     = var.base
  scalardl = var.scalardl
  envoy    = var.envoy
}
