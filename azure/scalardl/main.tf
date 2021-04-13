module "scalardl" {
  source = "git::https://github.com/scalar-labs/scalar-terraform.git//modules/azure/scalardl?ref=v1.5.0"

  # Required Variables (Use remote state)
  network   = local.network
  cassandra = local.cassandra

  # Optional Variables
  base     = var.base
  envoy    = var.envoy
  scalardl = local.scalardl
}
