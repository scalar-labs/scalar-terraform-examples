module "scalardl" {
  source = "git::https://github.com/scalar-labs/scalar-terraform.git//modules/azure/scalardl?ref=test-goss"

  # Required Variables (Use remote state)
  network   = local.network
  cassandra = local.cassandra

  # Optional Variables
  base     = var.base
  envoy    = var.envoy
  scalardl = local.scalardl
}
